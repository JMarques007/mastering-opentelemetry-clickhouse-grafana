# Quiz - Review questions and answers

## Questions

1. Why is automatic instrumentation not always enough?
2. What makes a span name useful?
3. Why are semantic conventions helpful?
4. What is one risk of high-cardinality labels?
5. Why should instrumentation be reviewed after deployment?
6. How should teams choose between logs, metrics and traces?
7. Why is telemetry ownership important?

## Answers

1. Automatic instrumentation cannot know all business operations or domain-specific decisions.
2. A useful span name describes a meaningful operation that an engineer can recognize during investigation.
3. Semantic conventions make telemetry consistent across services, tools and teams.
4. High-cardinality labels can increase cost and make queries slower or harder to reason about.
5. Real production telemetry may reveal missing context, unsafe fields or unhelpful names that were not obvious in code review.
6. Metrics answer trend and alert questions, traces answer request-flow questions and logs answer detailed event questions.
7. Owned telemetry is maintained, reviewed and improved as the service changes.
