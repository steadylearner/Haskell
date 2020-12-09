{-# LANGUAGE OverloadedStrings #-}

-- Search keywords used here.

module QuotesStore where

import Text.Emoji

quotes =
 [(pure "Do not beat a "
   <> (emojiFromAlias "coffin")
   <> (pure " ")
   <>  (emojiFromAlias "horse")),

 (pure "Every "
   <> (emojiFromAlias "dog")
   <> (pure " ")
   <> (pure "has its ")
   <> (emojiFromAlias "calendar")),

 (emojiFromAlias "heart")
   <> (pure " is ")
   <> (emojiFromAlias "dark_sunglasses"),

 (pure "Don't ")
   <> (emojiFromAlias "sob")
   <> (pure " over spilt milk"),

 (emojiFromAlias "hammer")
   <> (pure " the ")
   <> (emojiFromAlias "round_pushpin")
   <> (pure " over the ")
   <> (pure " over the ") <> emojiFromAlias "face_with_head_bandage"]