{-# OPTIONS --cubical --safe #-}
module TerminalBoundarySystems.TBS where

open import Agda.Primitive
open import Data.Empty
open import Cubical.Foundations.Prelude
open import TerminalBoundarySystems.Foundations

record TBS (ℓ₀ ℓ₁ : Level) : Set (lsuc (ℓ₀ ⊔ ℓ₁)) where
  field
    C : PreCategory ℓ₀ ℓ₁
    B : PreCategory.Obj C
    uniqIn : ∀ X → Σ[ f ∈ (X PreCategory._⇒_ B) ] (∀ g → g ≡ f)
    noOut : ∀ {Y} → (B PreCategory._⇒_ Y) → ⊥
