module Handler.Query where

import Import
import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3)
import Handler.Home
import Data.Maybe
import Data.Text (strip)

getQueryR :: Handler Html
getQueryR = do
  ((result, _), _) <- runFormGet sampleForm
  case result of
    FormSuccess (TranscriptForm trans) -> do
      ps <- runDB $ selectList [BindingRna ==. strip trans] []
      let val = map ( (bindingProtein &&& bindingPosition). entityVal) ps
      defaultLayout $(widgetFile "query")
    _ -> redirect HomeR

-- postHomeR :: Handler Html
-- postHomeR = do
--     ((result, formWidget), formEnctype) <- runFormPost sampleForm
--     let handlerName = "postHomeR" :: Text
--         submission = case result of
--             FormSuccess res -> Just res
--             _ -> Nothing
--
--     defaultLayout $ do
--         let (commentFormId, commentTextareaId, commentListId) = commentIds
--         aDomId <- newIdent
--         setTitle "Welcome To Yesod!"
--         $(widgetFile "homepage")
