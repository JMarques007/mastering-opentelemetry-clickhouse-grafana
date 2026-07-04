# Quiz - Review questions and answers

## Questions

1. What does a receiver do?
2. Why are processors useful?
3. What is the difference between an agent and gateway deployment?
4. Why should the Collector itself be monitored?
5. What is a risk of filtering telemetry too aggressively?
6. Why is batching commonly used?
7. Where should backend-specific routing logic usually live?

## Answers

1. A receiver accepts telemetry from applications, agents or other systems.
2. Processors modify telemetry in flight. They can batch, filter, enrich, redact or protect the Collector from memory pressure.
3. An agent runs close to workloads and is useful for local collection. A gateway centralizes routing, policy and export behavior.
4. The Collector is part of the observability platform. If it drops, delays or fails to export data, incident investigation becomes less reliable.
5. Aggressive filtering can remove the evidence needed to understand an incident.
6. Batching improves export efficiency and reduces overhead, but batch size and latency must be tuned carefully.
7. Backend-specific routing should usually live in the Collector so applications remain decoupled from backend changes.
