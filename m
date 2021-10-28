Return-Path: <SRS0=onBR=PQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZKhMXWdgqQvIowlr0O1nyBuVk1nN3mqj2rKVZ1PBL/Y=;
        b=oJWHgTrqZoG6OhYYHCVBGpXw51In5lGkIYW0dh/xD0tw98/6IQfLLDDUbEwqrfbZRa
         ZI8I0ZZpye+oekf3RemAD/dfokXid2ihRyVtaa0uDK4OFAzlPmIXAPCmia9B8S4kqZwr
         YQ790Y+CYEAfaVNzcaaWaE1KR//fGTQUFl7ePOcbr7+oq3EW1JMfJJcRLOdpIRaF5f8W
         FX9Ue48wbx3X4BsQb/4KnNo7qf7veHWD6/iOEZSzE3zBU6EUxAev1uhj91chlFTLJ383
         9U/J/ZJVOwgSb4eiCaz0UOy6wdbKyg2JdB2SUKy/xz+31ik1GpsrSdw/BK2Gvmk8748t
         RfAg==
Subject: [PATCH -perfbook 4/5] datastruct: Expand on the dash type of traces
 in Figure 10.19
References: <48719e0e-2828-7017-8efe-249dff1ef2a2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1156dd65-03a8-a47d-1747-06825a46f3b2@gmail.com>
Date: Thu, 28 Oct 2021 09:19:22 +0900
MIME-Version: 1.0
In-Reply-To: <48719e0e-2828-7017-8efe-249dff1ef2a2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The text reads "The uppermost three traces", but there appear
to be only two traces.
Put a footnote explaining how the dashed trace is composed.

Also mention the dash types in the text.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/datastruct.tex | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index d8cab069..ba429dfc 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1613,7 +1613,10 @@ fixed-size 524,288-bucket hash table, and a third for a resizable
 hash table that shifts back and forth between 262,144 and 524,288
 buckets, with a one-millisecond pause between each resize operation.
 
-The uppermost three traces are for the 262,144-element hash table.
+The uppermost three traces are for the 262,144-element hash table.\footnote{
+	You see only two traces?
+	The dashed one is composed of two traces that differ
+	only slightly, hence the irregular-looking dash pattern.}
 The dashed trace corresponds to the two fixed-size hash tables,
 and the solid trace to the resizable hash table.
 In this case, the short hash chains cause normal lookup overhead
@@ -1626,10 +1629,10 @@ In particular, the entire hash table fits into L3 cache.
 % millisecond is clearly too short a time.
 
 The lower three traces are for the 2,097,152-element hash table.
-The upper trace corresponds to the 262,144-bucket fixed-size hash table,
-the trace in the middle for low CPU counts and at the bottom for high
-CPU counts to the resizable hash table, and the other trace
-to the 524,288-bucket fixed-size hash table.
+The upper dashed trace corresponds to the 262,144-bucket fixed-size
+hash table, the solid trace in the middle for low CPU counts and at
+the bottom for high CPU counts to the resizable hash table,
+and the other trace to the 524,288-bucket fixed-size hash table.
 The fact that there are now an average of eight elements per bucket
 can only be expected to produce a sharp decrease in performance,
 as in fact is shown in the graph.
-- 
2.17.1


