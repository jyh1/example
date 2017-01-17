module DatabaseFields where

import Database.Persist.TH
import Prelude

data Published = Published | NotPublished
    deriving (Read, Eq)
derivePersistField "Published"

instance Show Published where
  show Published = "Published"
  show NotPublished = "Not Published"

data GenomicLocation = GenmoicLocation {
    chromosome :: Int
  , sequenceRange :: (Int, Int)
  , cdsRange :: (Int, Int)
}
  deriving (Show, Read, Eq)
derivePersistField "GenomicLocation"

-- instance Show GenomicLocation where
--   show (GenomicLocation chromo (sSt, sEn) (cdsSt, cdsEn)) =
--     unlines ["Chromosome " + show chromo]
