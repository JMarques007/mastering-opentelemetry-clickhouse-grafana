# Module 08 - Instrumentation Slide Outline

## Slide 1 - Instrumentation Is Application Design

**Core message:** Observability quality is decided when engineers choose what software emits.

**Visual:** Simple flow from production symptom to operational question to telemetry design.

**Speaker notes:**
Start with the production problem, not with APIs. A user reports a slow or failed operation. The platform can only help if the application emitted useful evidence. Instrumentation is therefore an engineering design activity, not a checkbox after deployment.

## Slide 2 - The Key Question

**Core message:** Do not ask only what can be collected. Ask what must be known during failure.

**On-slide text:**

> What will we need to know when this operation fails in production?

**Speaker notes:**
Explain that this question prevents noisy instrumentation. It forces the team to think about incidents, ownership, safe context and decision-making.

## Slide 3 - Automatic vs Manual Instrumentation

**Core message:** Automatic instrumentation gives coverage; manual instrumentation gives meaning.

**Visual:** Two-layer diagram: technical skeleton and business narrative.

**Speaker notes:**
Automatic instrumentation is excellent for HTTP, database, messaging and runtime visibility. But it cannot know that a method represents manufacturing order validation or payment authorization. Manual instrumentation should be added at business and dependency boundaries.

## Slide 4 - Where to Add Custom Spans

**Core message:** Add spans where decisions, dependencies or latency boundaries exist.

**On-slide examples:**

- `checkout.authorize_payment`
- `inventory.reserve_stock`
- `integration.erp.send_request`
- `manufacturing_order.validate`

**Speaker notes:**
Good span names are stable and operational. Avoid code-shaped names such as `DoWork`, `Handle` or `ProcessAsync`. The trace should read like the operation story.

## Slide 5 - Attribute Design

**Core message:** Attributes must be useful, safe and consistent.

**Visual:** Three columns: keep, generalize, reject.

**Speaker notes:**
Use semantic conventions where possible. Preserve stable classifications such as environment, operation, dependency type and failure category. Reject secrets, raw payloads, personal data and unique identifiers when they would create privacy or cardinality risks.

## Slide 6 - Metrics, Traces and Logs

**Core message:** Each signal answers a different production question.

**On-slide table:**

| Question | Signal |
|---|---|
| Is it getting worse? | Metric |
| Where was time spent? | Trace |
| What exact event happened? | Log |
| How do we investigate one request? | Correlation |

**Speaker notes:**
Avoid turning every detail into every signal. Metrics detect symptoms and support alerts. Traces explain execution flow. Logs provide event evidence. Correlation makes them useful together.

## Slide 7 - Cardinality and Cost

**Core message:** High-cardinality labels can turn useful telemetry into an operational problem.

**Visual:** One normalized route versus thousands of raw URLs.

**Speaker notes:**
Explain that metrics are especially sensitive to cardinality. Use controlled labels for metrics. Put detailed request-level context in traces or logs only when it is safe and intentionally retained.

## Slide 8 - Production Review

**Core message:** Instrumentation must be reviewed after deployment with real telemetry.

**Review checklist:**

- Are span names readable?
- Are labels controlled?
- Are logs correlated with traces?
- Are sensitive fields absent?
- Does the telemetry support a decision?

**Speaker notes:**
A pull request review is not enough. Some problems only appear in real data: unbounded labels, unresolved routes, missing trace ids, noisy spans or dashboards that cannot answer operational questions.

## Slide 9 - Lab Briefing

**Core message:** Learners will design and review instrumentation for checkout authorization.

**Speaker notes:**
Frame the lab as a design review. The goal is not to collect the most telemetry. The goal is to produce telemetry that answers production questions safely and clearly.

## Slide 10 - Key Takeaways

**Core message:** Good instrumentation changes engineering decisions.

**On-slide summary:**

- Start with production questions.
- Combine automatic and manual instrumentation.
- Name spans using business language.
- Use safe, stable attributes.
- Control metric cardinality.
- Review telemetry after deployment.

**Speaker notes:**
Close by reinforcing that telemetry has value only when it helps teams make better decisions during incidents, performance reviews and architecture discussions.
