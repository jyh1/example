module DatabaseFields where

import Database.Persist.TH
import Prelude

data Published = Published | NotPublished
    deriving (Read, Eq)
derivePersistField "Published"

instance Show Published where
  show Published = "Published"
  show NotPublished = "Not Published"
