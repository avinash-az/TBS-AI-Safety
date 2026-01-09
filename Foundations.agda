
{-# OPTIONS --cubical --safe #-}

module TerminalBoundarySystems.Foundations where

open import Agda.Primitive
open import Data.Unit.Base using (⊤; tt)
open import Cubical.Foundations.Prelude

record PreCategory (ℓ₀ ℓ₁ : Level) : Set (lsuc (ℓ₀ ⊔ ℓ₁)) where
  field Obj : Set ℓ₀
  field _⇒_ : Obj → Obj → Set ℓ₁
  field id : ∀ {A} → A ⇒ A
  field _∘_ : ∀ {A B C} → B ⇒ C → A ⇒ B → A ⇒ C

record Presheaf {ℓ₀ ℓ₁} (C : PreCategory ℓ₀ ℓ₁) (ℓ : Level)
  : Set (lsuc (ℓ₀ ⊔ ℓ₁ ⊔ ℓ)) where
  field
    F₀ : PreCategory.Obj C → Set ℓ
    F₁ : ∀ {X Y} → X PreCategory._⇒_ Y → F₀ Y → F₀ X

record NatTrans {ℓ₀ ℓ₁ ℓ} {C : PreCategory ℓ₀ ℓ₁}
                (F G : Presheaf C ℓ)
  : Set (lsuc (ℓ₀ ⊔ ℓ₁ ⊔ ℓ)) where
  field
    η : ∀ X → F .Presheaf.F₀ X → G .Presheaf.F₀ X
    natural : ∀ {X Y} (f : X PreCategory._⇒_ Y)
                (x : F .Presheaf.F₀ Y) →
                G .Presheaf.F₁ f (η Y x)
                ≡ η X (F .Presheaf.F₁ f x)
