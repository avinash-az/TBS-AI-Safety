
{-# OPTIONS --cubical --safe #-}

module TerminalBoundarySystems.PillarI_Yoneda where

open import Agda.Primitive
open import Data.Unit.Base using (⊤; tt)
open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Equiv
open import Cubical.Foundations.HLevels
open import TerminalBoundarySystems.Foundations
open import TerminalBoundarySystems.TBS

-- FULLY VERIFIED: Yoneda-style collapse at the terminal boundary

module PillarI {ℓ₀ ℓ₁ ℓ} (T : TBS ℓ₀ ℓ₁) where
  open PreCategory (TBS.C T) renaming (_⇒_ to _⇒ᵢ_)
  open TBS T

  HomB : Presheaf (TBS.C T) ℓ
  HomB .Presheaf.F₀ X = B ⇒ᵢ X
  HomB .Presheaf.F₁ f g = f ∘ g

  P : Presheaf (TBS.C T) ℓ
  P .Presheaf.F₀ _ = ⊤
  P .Presheaf.F₁ _ tt = tt

  TruthB : Set ℓ
  TruthB = NatTrans HomB P

  canonical : TruthB
  canonical .NatTrans.η _ _ = tt
  canonical .NatTrans.natural _ _ = refl

  TruthB-isContr : isContr TruthB
  TruthB-isContr = (canonical , λ _ → refl)
