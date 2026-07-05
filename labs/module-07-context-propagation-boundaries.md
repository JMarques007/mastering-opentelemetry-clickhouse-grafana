# Lab - Context Propagation Across HTTP and Messaging Boundaries

## Module

Module 07 - Context Propagation

## Duration

45-60 minutes

## Goal

Validate whether trace context is preserved across a synchronous HTTP call and an asynchronous message boundary.

## Scenario

A simplified order workflow contains three components:

1. `api-service` receives a request from the user.
2. `order-service` is called over HTTP.
3. `fulfillment-worker` consumes a message created by the order service.

The application works, but the trace backend shows two traces:

- one trace for `api-service` and `order-service`;
- a second root trace for `fulfillment-worker`.

The learner must determine where propagation was lost and propose the correction.

## Learning Outcomes

By the end of this lab, participants should be able to:

- inspect a `traceparent` value;
- explain context injection and extraction;
- identify whether HTTP propagation is working;
- identify why queue-based work starts a new root trace;
- propose a safe propagation fix for message metadata;
- explain when a span link may be preferable to a strict parent-child relationship.

## Prerequisites

- Completion of Module 06 - Traces.
- Familiarity with trace ids, span ids, root spans and parent spans.
- Access to any trace viewer, logs or mocked trace records.

This lab can be run as a discussion exercise, a whiteboard exercise or a practical implementation exercise in a local demo application.

## Part 1 - Inspect the Expected Request Path

Draw the expected flow:

```text
User request
  -> api-service HTTP server span
    -> order-service HTTP client span
      -> order-service HTTP server span
        -> message publish span
          -> fulfillment-worker message consume span
```

Record the expected propagation carriers:

| Boundary | Carrier | Expected context location |
|---|---|---|
| User/API to `api-service` | HTTP request | `traceparent` header if upstream exists, otherwise new root trace. |
| `api-service` to `order-service` | HTTP request | `traceparent` header injected by HTTP client instrumentation. |
| `order-service` to queue | Message metadata | Trace context injected into message attributes or headers. |
| Queue to `fulfillment-worker` | Message metadata | Trace context extracted before the consume span starts. |

## Part 2 - Review the Observed Trace Evidence

Use the following mocked trace evidence:

### Trace A

| Service | Span | Parent | Trace id |
|---|---|---|---|
| api-service | `HTTP POST /orders` | root | `7d9f...a101` |
| api-service | `HTTP POST order-service /orders` | `HTTP POST /orders` | `7d9f...a101` |
| order-service | `HTTP POST /orders` | `HTTP POST order-service /orders` | `7d9f...a101` |
| order-service | `queue publish fulfillment.requested` | `HTTP POST /orders` | `7d9f...a101` |

### Trace B

| Service | Span | Parent | Trace id |
|---|---|---|---|
| fulfillment-worker | `process fulfillment.requested` | root | `a64b...c992` |
| fulfillment-worker | `database update shipment` | `process fulfillment.requested` | `a64b...c992` |

## Part 3 - Identify the Propagation Break

Answer these questions:

1. Which boundary most likely lost context?
2. Which evidence proves that HTTP propagation worked?
3. Which evidence suggests that message propagation failed?
4. Should the worker span be a child span, a linked span or a clean new root span? Explain the trade-off.

## Part 4 - Validate the Carrier

Inspect the outgoing message metadata from `order-service`.

Expected metadata example:

```text
traceparent = 00-7d9f000000000000000000000000a101-5b8e00000000a201-01
```

If the metadata is missing, context was not injected by the producer.

If the metadata exists but Trace B still starts as a new root, the consumer probably failed to extract context before starting the processing span.

## Part 5 - Propose the Fix

Write a short implementation plan:

1. Ensure the producer injects current OpenTelemetry context into message metadata.
2. Ensure the consumer extracts context before creating the processing span.
3. Add a test that publishes a message and verifies the worker span has the expected trace id or link.
4. Add structured logs on producer and consumer with `trace_id` and `span_id`.
5. Review whether the relationship should be parent-child or span link based on the messaging semantics.

## Part 6 - Production Readiness Check

Define a validation checklist for the service team:

- [ ] HTTP calls preserve `traceparent`.
- [ ] Gateway or proxy configuration does not strip trace headers.
- [ ] Message producer writes trace context to metadata.
- [ ] Message consumer extracts trace context before creating spans.
- [ ] Logs include trace id and span id on both sides of the boundary.
- [ ] Root-span count does not unexpectedly increase after deployment.
- [ ] Baggage, if used, contains only safe and bounded values.

## Expected Answer

The propagation break occurs between the message publish span and the fulfillment worker. HTTP propagation is working because `api-service` and `order-service` share the same trace id and have a valid parent-child relationship. The worker starts a separate root trace with a different trace id, which indicates that message metadata was either missing or not extracted.

A strong answer also explains that asynchronous messaging may use either a parent-child relationship or a span link depending on the desired semantics. The important point is that the relationship must be intentional and visible during investigation.

## Instructor Notes

Use this lab to reinforce that broken propagation is often invisible to users but costly during incidents. Ask learners to explain the difference between an application failure and an observability failure. Then ask how they would detect this issue automatically after a deployment.

## Extension Exercise

Design a query or dashboard panel that detects unusual increases in root spans for downstream services. The panel should help identify propagation regressions after deployments, gateway changes or client library upgrades.