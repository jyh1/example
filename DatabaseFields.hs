module DatabaseFields where

import Database.Persist.TH
import Prelude
import Data.Text

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

data Product = Product {
    description :: Text
  , aminoAcids :: Int
  , kDa :: Double
}
  deriving (Show, Read, Eq)
derivePersistField "Product"

data GeneInfo = GeneInfo{
    standardName :: Text
  , systematicID :: Text
  , cds :: Text
  , synonyms :: Text
}
  deriving (Show, Read, Eq)
derivePersistField "GeneInfo"

-- instance Show GenomicLocation where
--   show (GenomicLocation chromo (sSt, sEn) (cdsSt, cdsEn)) =
--     unlines ["Chromosome " + show chromo]
