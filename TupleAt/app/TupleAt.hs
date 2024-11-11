{-# LANGUAGE TemplateHaskell #-}
module TupleAt where

import Language.Haskell.TH

sel i n = lamE [pat] rhs
    where pat = tupP (map varP as)
          rhs = varE (as !! (i - 1))
          as  = [ mkName $ "a" ++ show j | j <- [1..n] ]
