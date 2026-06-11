# AI Bonus Feature: Support Ticket Auto-Tagging

This project includes a simple AI-style automation feature.

## Purpose

The feature automatically suggests:

- Issue category
- Ticket priority

based on the customer issue description.

## Why This Is Useful

In real e-commerce support teams, many tickets are raised daily.

Auto-tagging can help:

- Route tickets faster
- Identify common complaint types
- Prioritize serious issues
- Reduce manual support effort
- Improve reporting quality

## Approach Used

This project uses a simple keyword-based rule system.

Example:

If the issue description contains words like:

- refund
- money back
- amount not received

then the predicted issue category is:

Refund

If the issue description contains words like:

- delayed
- not delivered
- courier

then the predicted issue category is:

Delivery

## Important Note

This is not a production-level AI model.

It is a beginner-friendly automation feature added as a project bonus.

It can be improved later using:

- Natural Language Processing
- Text classification
- Machine learning models
- LLM-based ticket summarization
