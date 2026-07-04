# Exercise - Propagation break analysis

## Goal

Diagnose where a trace becomes fragmented across service boundaries.

## Scenario

A request enters Service A, calls Service B over HTTP and sends a message consumed by Service C. In the trace backend, Service A and B appear in one trace, but Service C appears as a new root trace.

## Instructions

1. Identify the expected propagation path.
2. Identify the boundary where context was lost.
3. Explain which metadata should carry context across the message boundary.
4. Describe how logs would reveal the mismatch.
5. Propose a fix using standard OpenTelemetry propagation.

## Expected outcome

Learners should explain that asynchronous boundaries need context injection and extraction. A strong answer checks producer metadata, consumer extraction and trace ids in logs.

## Instructor notes

Use this exercise to show that broken propagation is often an observability failure, not an application failure. The system may work while the trace story is incomplete.
