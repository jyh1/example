module Handler.Query where

import Import
import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3)
import Handler.Home

getQueryR :: Handler Html
getQueryR = do
  ((result, _), _) <- runFormGet sampleForm
  case result of
    FormSuccess (TranscriptForm trans) -> defaultLayout [whamlet|
          <p>
            The query transcript is #{trans}
        |]
    res -> error (show res)

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
