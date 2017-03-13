Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=QubsFXuxoIIuK6GB588NConEKwZwWqI1yRBCkGmlWG4=;
 b=edsGh9O/Xi6owollVX37pDsRL28gVBKW8TqlPY/X9K/t09/6JW5XdYafssANOw6gpU
 zMhUqaiJIPkuamVOaiuQLW57g7DgO54JP124L2662eHy1o5iBdHIq6gTclmXW2oH5s1O
 gQEU5BG8M/11Or0V7bZI+8NxDpv1rV9DtMRTiubvEtd8Xyb9VWn8gGjDTaYf1tebVGOu
 pIpre3/Ek+CjMCQAzyirYsxA4tOHhaXQAyRJMX1FJ2g4zWxDsq59HAJQmDw9TC3SFpcn
 6OuxLe2WOVnPhYfqHmWn09wTjBBeJk4V1rbxByF2gDhqjeJW1syMwc54dKtKr9eolPl+
 0F6A==
Subject: [PATCH 4/6] formal/spinhint: Refer explicit Figure labels
References: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6036c7e3-122d-f828-354b-b421399b7a94@gmail.com>
Date: Tue, 14 Mar 2017 07:47:17 +0900
MIME-Version: 1.0
In-Reply-To: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7211be04d75a719b92754c2d14d7d23e5656be30 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Mar 2017 20:48:23 +0900
Subject: [PATCH 4/6] formal/spinhint: Refer explicit Figure labels

Referring floating figures should be done by labels.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/spinhint.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index d6acef1..a18ae23 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -742,7 +742,9 @@ Lines~30 and~31 initialize the control variables,
 lines~32-40 atomically sum the havelock array entries,
 line~41 is the assertion, and line~42 exits the loop.

-We can run this model by placing the above two code fragments into
+We can run this model by placing the two code fragments of
+Figures~\ref{fig:analysis:Promela Code for Spinlock}
+and~\ref{fig:analysis:Promela Code to Test Spinlocks} into
 files named \path{lock.h} and \path{lock.spin}, respectively, and then running
 the following commands:

-- 
2.7.4


