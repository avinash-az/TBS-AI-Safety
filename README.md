# Terminal Boundary Systems (TBS)
**A Partially Machine-Verified Framework for the Limits of Absolute Self-Explanation**

Author: Avinash A.  
Status: Active research / partial formal verification  
Proof assistant: Cubical Agda (`--cubical --safe`)

---

## Overview

This repository contains a formal, machine-checked core of a categorical framework called **Terminal Boundary Systems (TBS)**.  
The framework investigates **structural limits on absolute self-explanation**, unifying ideas from:

- Gödel incompleteness
- Lawvere fixed-point theorems
- Categorical semantics
- Modal and reflective systems

The central result is an **impossibility program**:  
> No system with a strict terminal boundary can internally provide a complete, faithful, and non-trivial self-explanation.

A key portion of this claim is **already machine-verified** in Cubical Agda.

---

## What Is Machine-Verified

### ✅ Verified Core Result (Pillar I)

The following result is **fully formalized and checked by Agda**:

> **Yoneda Collapse at the Terminal Boundary**  
> For any Terminal Boundary System, the space of natural transformations  
> from the boundary hom-functor to the constant truth presheaf is **contractible**.

Formally:
- A presheaf `Hom(B, -)` is defined
- A constant presheaf `⊤` is defined
- The type of natural transformations between them is shown to be equivalent to `⊤`
- This proves a collapse of semantic truth at the boundary

This result is constructive, cubical, and free of postulates.

---

## Formal Structure

### 1. PreCategory and Presheaves
A minimal categorical foundation suitable for Cubical Agda:
- Objects, morphisms, identities, composition
- Presheaves and natural transformations

### 2. Terminal Boundary Systems (TBS)
A TBS consists of:
- A precategory `C`
- A distinguished boundary object `B`
- Unique incoming morphisms into `B`
- No outgoing morphisms from `B`

This encodes an **information-theoretic terminal boundary**.

### 3. Strong Absolute Self-Explanation (ASE)
An abstract interface for systems that attempt to:
- Encode their own sentences
- Prove them internally
- Reflect proofs into semantic explanations

This is intentionally strong and exposes the tension leading to collapse.

---

## What Is Currently Postulated (Open Work)

The following components are **explicitly marked as postulates** and represent ongoing or future work:

### ⚠️ Pillar II — Lawvere Diagonal
- Requires formalizing cartesian closed structure
- A fully internal Lawvere diagonal lemma remains to be implemented

### ⚠️ Pillar III — Modal Collapse
- Introduces a modal falsehood object
- Requires a verified syntax–semantics reflection principle
- Boundary contradiction is currently postulated

### ⚠️ Full Impossibility Theorem
The final theorem:
```agda
impossibility : ∀ T → ¬ CompleteASE T
