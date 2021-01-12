Return-Path: <SRS0=JkcB=GP=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=B0+G3r7z2VOrSwt2MxmBxMSwXPjgj7XB+h8TtD1CmCw=;
        b=RmJ6EdVeP+Yx881eiK/j+wQNKjCadqp7tReJhNvRYU7d0e6FKpVWVOmo7tAKd7TOc5
         QwGlQIYaS/bSfMxXI8gx6QXUYTw+iyI1q6Bp0RKXbRQdWqBjzyfxWQUyI7R/qlGN8N5b
         XPzO9jsF5N9IdlFM9Hf+V+XMrltPJlzNk1tR8QkSLNjQFNegh6GFKfKgggFGbIFGBBYZ
         TovKaGcXpSm09Kgl0qhZKbVGy7g/L3jvBU+fbnaFakzSa2KmBA8MhKuljzSeCAJYiYtc
         Pq8G+oJcwSS7UEQHDDltjwKial24ebozAgmUg8Qrnxi438i4F+yGoWLrGtzwU+FpI8VX
         TOxQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] FAQ-BUILD: Fix answer to #14
Message-ID: <dfbeceb7-fc20-0963-9fb9-dc662656ee2e@gmail.com>
Date: Tue, 12 Jan 2021 20:41:24 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From bc1d4d5dac45513181c60bc3877a743c08991a8f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 12 Jan 2021 20:32:11 +0900
Subject: [PATCH -perfbook] FAQ-BUILD: Fix answer to #14

There were some confusions in the answer updated in commit
5462db2929fa ("Add Fedora-based Dockerfile").

If you have a different uid:gid pair, you need to explicitely
specify them in a "-u" option to the "docker run" command.

Also fix the tag name of the Fedora-based container image.

Fixes: 5462db2929fa ("Add Fedora-based Dockerfile")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index a7a0711d..0d3330b3 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -297,7 +297,12 @@
 
 		Note:
 		The prebuilt container image assumes <uid:pid> = <1000:1000>.
-		If you have different IDs, bash prompt will be in the
+		If you have different IDs, you can still run the image by
+		adding the option:
+
+		     -u $(id -u):$(id -g)
+
+		to the "docker run" command.  The bash prompt will be in the
 		form of "I have no name!@abcdef012345:/work$".	Builds of
 		perfbook will nevertheless succeed.  You can also build
 		a container image of your own:
@@ -307,7 +312,7 @@
 		      --build-arg uid=$(id -u) --build-arg gid=$(id -g) .
 
 		For those prefer a Fedora-based container image,
-		akiyks/perfbook-build-focal:latest is also available.
+		akiyks/perfbook-build-fedora:latest is also available.
 		It is built from docker/Dockerfile.fedora.
 
 		If you have podman already installed, you can run the image
-- 
2.17.1

