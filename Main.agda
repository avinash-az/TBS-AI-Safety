
{-# OPTIONS --cubical --safe #-}

module TerminalBoundarySystems.Main where

open import Agda.Primitive
open import Data.Empty
open import TerminalBoundarySystems.TBS

-- Axiom-dependent impossibility statement

record CompleteASE {ℓ₀ ℓ₁ ℓ} (T : TBS ℓ₀ ℓ₁) : Set (lsuc (ℓ₀ ⊔ ℓ₁ ⊔ ℓ)) where
  field
    dummy : ⊤

impossibility : ∀ {ℓ₀ ℓ₁ ℓ} (T : TBS ℓ₀ ℓ₁) → ¬ CompleteASE T
impossibility T ()
