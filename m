Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0B+9AWhgGvNThb9Y87OqjihufLOT36RvkAxUsjLjdg8=;
        b=CiMtBCfsvJIJMi86JNbdNb9Z1deOS4fAmO1xPZFv4GkfXtTCUOLm3/56j7aclJBsf7
         nLH+TaenqGgkbkjnXbYd2YmfP33btgqe0FKsoNR1wUZVcgZba9PWRbAZy9lBGQM96TkO
         v8AB3mM7iOGYWmvtVhsgxhM3fC6vBqyNYQfJ3w0Qom6fHtp58yViTl4TEJLFTEplBVxQ
         u260vikrNJGm2zD5yFbVsdUMwvR3J1SX8ctJk1u8KcRP3tQ+tEj32qjgnvkn2U8y/4Vz
         hzNQrQ+r3IvdpHdMwN1xb6TXW1vBrXIKcuI37FrMVWER77hKtzqAht8JOBhdRYeqXKS7
         TyyQ==
Subject: [PATCH 5/9] Exclude meta command lines in .litmus -> .litmus.herd
 conversion
References: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9beb54c5-cf56-006b-ee41-c51fc0162273@gmail.com>
Date: Sun, 23 Sep 2018 16:29:31 +0900
MIME-Version: 1.0
In-Reply-To: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cc8805ea5c2a65f60789adff102c64135bac1343 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 29 Aug 2018 21:15:54 +0900
Subject: [PATCH 5/9] Exclude meta command lines in .litmus -> .litmus.herd conversion

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/litmus2herd.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/formal/herd/litmus2herd.sh b/CodeSamples/formal/herd/litmus2herd.sh
index ebcd01b..c1a69bc 100644
--- a/CodeSamples/formal/herd/litmus2herd.sh
+++ b/CodeSamples/formal/herd/litmus2herd.sh
@@ -17,4 +17,6 @@
 
 grep -n -A1 -B1 "api.h" $1 | \
 sed -n 's/^\([0-9]\{1,\}\).*/\1d/p' | \
-sed -f - $1 > $2
+sed -f - $1 | \
+sed -e '/\\begin\[snippet\]/d' | \
+sed -e '/\\end\[snippet\]/d' > $2
-- 
2.7.4


