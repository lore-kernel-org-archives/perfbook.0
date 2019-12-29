Return-Path: <SRS0=/5BA=2T=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MtSnSZPHDympgx9TQvVEQDVSWIx8mZaUWgITicFyj/U=;
        b=GWiUwgYNzdHBqV9JwuEXb5k5rwHfkpZIYxZgQh4lZ1I7LDbTNAdl7s7AEld4ZW7uYT
         2Vs5IwGLe8fBMEI3SQ2VKJYr8LUNCSptCIFu3IP4BCvD/aGJ9tl5P2FYWsZt8I5gKbXF
         PFzLqzUkXKDIzQBEcB9zWlLx2/RshFjtF+E9NgW2oTnAOyW6bQLX0lOJdDzT8VMhECzW
         8TJLl4DMHncExCIBOXKZZiaBjl/p3fmacmJaaDCTA9bxtRcEWk+6Qh17R2UjZhAGBAB6
         HIB/oySZHbjkR+CVFhIBa+UM5+NAbFB5YrErGBNRs+d7dSvULVaXeUrbnI9btHei1NE4
         qNMw==
Subject: [PATCH 2/3] utilities/autodate: Ignore untracked files in 'git
 status'
References: <861d7415-b129-5d98-b28c-1988bc2359a4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <eb85a177-9a15-19cb-9c0c-12858ddc23f8@gmail.com>
Date: Sun, 29 Dec 2019 19:25:02 +0900
MIME-Version: 1.0
In-Reply-To: <861d7415-b129-5d98-b28c-1988bc2359a4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c9778ef5caf2375ce7e0d02390c97efda9e6e603 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 29 Dec 2019 17:51:13 +0900
Subject: [PATCH 2/3] utilities/autodate: Ignore untracked files in 'git status'

This is safe because untracked files won't have any effect in the
resulting .pdf unless at least one of the tracked files is modified.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/autodate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index 924fa6ee..2ebc0754 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -33,7 +33,7 @@ then
 else
 	date_str=`git show --format="%cD" | head -1`
 	# check if git status is clean
-	gitstatus=`git status --porcelain | wc -l`
+	gitstatus=`git status -uno --porcelain | wc -l`
 	if [ $gitstatus != "0" ]
 	then
 		modified="(m)"
-- 
2.17.1


