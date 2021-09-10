Return-Path: <SRS0=8s4x=OA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JHHSJINWPOWNA1AbcEjTS4L0jqAEEpXW8YHgdsOAAvY=;
        b=De7raP1IiGTCm78AuMdlC65yWmQUY8BVP6lligRJEesZzHwg4XLsrkL0XNNkg3VB7Y
         2pNnepUO031ehO2XnQVslQsDwF0j6Lm4Ct2yhWIxEeL5367VxkszhZX8dcKBwyPenI79
         B2WCV+93e9f9SURE4BYByIUX4SGb3uaqovdjPU2LNftA1/9Z8vIh9r4hQcYks9WkcvIo
         KPubSvpiQJZPxwhdySZpoJ/jLnpHldh+o5cVcH5qZfRkgf0LYu01itsiD2BcXf0keNvD
         NSVSJcBhHe0iooES6jDtmpE4nY7Y/uHWL1G/CSctxiMr4DIf3bbYFd2pg3144aYmPt7D
         TZnA==
Subject: [PATCH --perfbook v2 1/3] formal: Fix another path of
 RCU-test-ratio.pdf
References: <19d34b29-3ccf-39c9-c933-c53fcf552a47@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2a11d7b2-6fc1-5897-ceb4-2ea8e9722163@gmail.com>
Date: Fri, 10 Sep 2021 19:11:44 +0900
MIME-Version: 1.0
In-Reply-To: <19d34b29-3ccf-39c9-c933-c53fcf552a47@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This plot is conditionally included from three places.
Fix remaining one commit 6cebe12f7e29 ("formal: Move formal/data to
CodeSamples/formal/data") failed to update.

Fixes: 6cebe12f7e29 ("formal: Move formal/data to CodeSamples/formal/data")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/formal.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/formal.tex b/formal/formal.tex
index 55a5ed98..c79360ed 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -262,7 +262,7 @@ validation, and that is the insurance policy.
 \IfTwoColumn{
 \begin{figure*}
 \centering
-\resizebox{6in}{!}{\includegraphics{formal/RCU-test-ratio.pdf}}
+\resizebox{6in}{!}{\includegraphics{CodeSamples/formal/data/RCU-test-ratio.pdf}}
 \caption{Linux-Kernel RCU Test Code}
 \label{fig:formal:Linux-Kernel RCU Test Code}
 \end{figure*}
-- 
2.17.1


