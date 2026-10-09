# evaluation-report

A structured report of finished work with built-in reflection — whose proposed rules feed [skill-evolution](../skill-evolution/).

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../GETTING_STARTED.md) · [Install](../../INSTALL.md)

## Problem

Without a report, insights live only in the current context: lessons must be relearned, transferable rules are neither named nor tracked, and there is no structure that makes sessions comparable over time.

This skill attempts to solve that by:
- providing a report template for finished work
- structuring reflection explicitly (what was applied, what worked, what to improve)
- making reports comparable, so rules and insights accumulate instead of evaporating

## Strategy (mock)

Planned approach, not implemented yet:
- a report template with a fixed entry structure
- a built-in reflection section with four fixed parts:
  - applied rules
  - strengths with evidence
  - improvements with fixes
  - proposed rules with an implementation target
- reports are invoked by the [workflow](../workflow/) meta-skill; their proposed rules are the input for [skill-evolution](../skill-evolution/)
