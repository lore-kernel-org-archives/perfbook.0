Return-Path: <SRS0=Gk1L=CD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686822807; x=1689414807;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Orrrs9fZS9cZ/RsZPLD4nJktosY+K0tZejCzJcISDO8=;
        b=pLRWJcX4mk6aPYw4fjjhjzNPZUniUVTQ4wwy9Qfy0ntywjOilfhQuJiQCWa+T3BSoZ
         LYRSVuSjjvRe4jNZKRR3Eij5OtLCHIeRUtm8xgo0sNagpFdW2f7XQBQlUwNC7xopNcI5
         U80pBm+rw4oK6mYLoQUORjc81DGEBHfzxxd9nPgo+MmItYjhd23OEF3P0NMHSQfSL+1s
         r2azC6/tgsGJ1JS8O3QQBO9PiMB7U6qHf1spYonrsQTpWWURtm5qHX0Ylk51hHG3z1d3
         6vkYQiGw9SIFoyVl7FvyK7RoLafAr+MIZ6Z70CfJKBzNXYeY+zCbX4TV0oOJkssfzBnN
         H+Ow==
Message-ID: <1a339fed-9598-5c8b-3da5-33d629a34b59@gmail.com>
Date: Thu, 15 Jun 2023 18:53:24 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 4/6] docker/Dockerfile: Use 'latest' as the default
 tag
Content-Language: en-US
References: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

ubuntu:jammy (22.04) based image works just fine for building
perfbook.  The tag of "latest" should work fine.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 docker/Dockerfile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docker/Dockerfile b/docker/Dockerfile
index 1fec609a0043..faa0a0fb5a31 100644
--- a/docker/Dockerfile
+++ b/docker/Dockerfile
@@ -1,4 +1,5 @@
-FROM ubuntu:focal
+ARG rel=latest
+FROM ubuntu:$rel
 
 RUN apt-get update && apt-get install -y locales && \
     localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
-- 
2.25.1


