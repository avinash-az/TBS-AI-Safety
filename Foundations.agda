{-# OPTIONS --cubical --safe #-}
module TerminalBoundarySystems.Foundations where

open import Agda.Primitive
open import Data.Unit.Base using (⊤; tt)
open import Cubical.Foundations.Prelude

record PreCategory (ℓ₀ ℓ₁ : Level) : Set (lsuc (ℓ₀ ⊔ ℓ₁)) where
  field
    Obj : Set ℓ₀
    _⇒_ : Obj → Obj → Set ℓ₁
    id  : ∀ {A} → A ⇒ A
    _∘_ : ∀ {A B C} → B ⇒ C → A ⇒ B → A ⇒ C
