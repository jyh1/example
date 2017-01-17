{-# LANGUAGE FlexibleInstances #-}

module Model where

import ClassyPrelude.Yesod
import Database.Persist.Quasi

import DatabaseFields
-- You can define all of your database entities in the entities file.
-- You can find more information on persistent and how to declare entities
-- at:
-- http://www.yesodweb.com/book/persistent/
-- data Published = Published | NotPublished
--     deriving (Show, Read, Eq)
-- derivePersistField "Published"
--
-- data GenomicLocation = GenmoicLocation {
--   chromosome :: Int
--   sequenceRange :: (Int, Int)
--   cdsRange :: (Int, Int)
-- }
--   deriving (Read, Eq)
-- derivePersistField "GenomicLocation"
--
-- instance Show GenomicLocation where
--   show (GenomicLocation chromo (sSt, sEn) (cdsSt, cdsEn)) =
--     unlines ["Chromosome " + show chromo]

share [mkPersist sqlSettings, mkMigrate "migrateAll"]
    $(persistFileWith lowerCaseSettings "config/models")
