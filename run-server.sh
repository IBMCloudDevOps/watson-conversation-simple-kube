#!/bin/bash
CONVERSATION_PASSWORD=$(echo "$BINDING" | jq '.password')
CONVERSATION_USERNAME=$(echo "$BINDING" | jq '.username')
npm start
