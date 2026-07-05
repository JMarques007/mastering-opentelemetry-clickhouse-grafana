# Module 07 Slides - Context Propagation

## Slide 1 - Module Title

**Title:** Context Propagation

**Subtitle:** Keeping distributed traces connected across service boundaries

**Speaker notes:**
Start by reminding learners that Module 06 explained traces as request-level evidence. This module explains what keeps that evidence connected when work moves across services, queues, jobs and protocols.

## Slide 2 - The Production Problem

**Visual:** One business request split into two unrelated traces.

**Key points:**

- The application can work while the trace story is broken.
- Fragmented traces increase incident investigation time.
- The failure is often at a boundary, not inside a business function.

**Speaker notes:**
Use the order and fulfillment example. Emphasize that broken propagation is an observability failure that becomes painful during incidents.

## Slide 3 - What Context Propagation Carries

**Visual:** Request identity moving from service to service.

**Key points:**

- Trace id identifies the distributed request.
- Span id identifies the current operation.
- Trace flags carry sampling intent.
- Context must be extracted and injected at every boundary.

**Speaker notes:**
Keep this slide conceptual. Avoid turning it into a header-format lecture too early.

## Slide 4 - W3C Trace Context

**Visual:** Annotated `traceparent` header.

```text
traceparent: 00-4bf92f3577b34da6a3ce929d0e0e4736-00f067aa0ba902b7-01
```

**Key points:**

- Standard propagation format.
- Improves interoperability.
- Should be preferred over custom formats.

**Speaker notes:**
Explain the fields briefly: version, trace id, parent span id and flags. Make clear that learners do not need to memorize the exact byte lengths to operate the system effectively.

## Slide 5 - Propagators

**Visual:** Extract on inbound, inject on outbound.

**Key points:**

- Propagators read and write context from carriers.
- HTTP carriers are headers.
- Messaging carriers are metadata or attributes.
- Custom protocols need explicit adapters.

**Speaker notes:**
This is the implementation bridge. Connect it to automatic instrumentation, but stress that automatic coverage is not guaranteed at every boundary.

## Slide 6 - Where Context Is Lost

**Visual:** Boundary risk table.

| Boundary | Typical failure |
|---|---|
| HTTP client | Headers not injected |
| Gateway/proxy | Headers stripped |
| Queue producer | Metadata missing |
| Queue consumer | Context not extracted |
| Background job | No triggering context |
| Manual async task | Runtime context lost |

**Speaker notes:**
Ask learners which boundary has caused problems in their own systems.

## Slide 7 - Baggage Is Not a Payload Bus

**Visual:** Safe vs unsafe baggage examples.

**Key points:**

- Baggage propagates broadly.
- Never include secrets, tokens or personal data.
- Keep values small and bounded.
- Treat baggage as an API contract.

**Speaker notes:**
Use this slide to connect observability design with security and privacy.

## Slide 8 - Diagnostic Method

**Visual:** Expected path compared with observed traces.

**Key points:**

1. Draw expected request path.
2. Find where the trace splits.
3. Inspect outgoing carrier.
4. Inspect downstream extraction.
5. Compare trace ids in logs.
6. Re-run and confirm.

**Speaker notes:**
This should feel like an incident playbook, not a theory slide.

## Slide 9 - Lab Walkthrough

**Visual:** API -> order service -> queue -> fulfillment worker.

**Key points:**

- HTTP propagation works.
- Queue propagation is broken.
- Learners must identify whether producer injection or consumer extraction failed.

**Speaker notes:**
Point learners to `labs/module-07-context-propagation-boundaries.md`.

## Slide 10 - Production Readiness Checks

**Visual:** Checklist.

**Key points:**

- Validate propagation during service onboarding.
- Check gateways and proxies.
- Test message metadata.
- Include trace ids in logs.
- Watch root-span count after deployments.

**Speaker notes:**
Close by reinforcing that a service is not fully observable just because it emits spans.

## Slide 11 - Common Mistakes

**Key points:**

- Assuming automatic instrumentation covers every boundary.
- Forgetting message metadata.
- Starting worker spans before extraction.
- Putting sensitive values in baggage.
- Treating all background work as accidental new root traces.

**Speaker notes:**
Ask learners to classify each mistake as implementation, architecture or governance.

## Slide 12 - Key Takeaways

**Key points:**

- Propagation keeps traces connected.
- W3C Trace Context is the default interoperability choice.
- Propagators inject and extract context.
- Async boundaries require explicit attention.
- Baggage must be safe, small and bounded.
- Propagation validation belongs in production readiness.

**Speaker notes:**
Transition to Module 08: instrumentation determines which operations become telemetry; propagation determines whether those operations remain connected.