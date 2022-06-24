Return-Path: <SRS0=xThF=W7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=t5BM5jFqceBZPX0D6wpe+t+/Ujg45AvPKf/0DU22WjY=;
        b=WWqc9dxAeUs3VCe27YlZzvm3V52QrVXzfIaP+lHV2BCyd6/zRgI+wwGKU44xHQK9WI
         ZJjSAqlkwUoNQ7T04OF3Rsa45mpUlkF0eB0xB2YQq2FMezGFePTA4iQR/vGFcDwwwNBO
         rCJcfceSz6h/071m13Duneid/8tm50e4at9u1Id09FpoM4ulPEzN/dDMkzeWhGgUYjhL
         5b8lxeJS+PSuGX9z1Vtj8IVFl1QUwnGl65EcoXOBadxNadDL4RjS8Zy0sBOf83AUh/4i
         ikJOVrumVRp4aQ9Fts/D+4Ule5IPtlHS7d+zZRHFU4saZmutfBOR+h1Ytof2KefJOKjr
         T2Xg==
Message-ID: <0685cf3f-cd6e-5e55-d173-8d12543a1fd2@gmail.com>
Date: Fri, 24 Jun 2022 23:36:10 +0900
MIME-Version: 1.0
Subject: [PATCH v2 -perfbook 2/2] defer/whichtochoose: Fix trivial typos
Content-Language: en-US
References: <9c889180-5bc3-9588-808b-d598e919c9f3@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <9c889180-5bc3-9588-808b-d598e919c9f3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
No change from v1
--
 defer/whichtochoose.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 95b355a1c471..489299a7ae02 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -83,7 +83,7 @@ techniques from one another.
 The ``Readers'' row summarizes the results presented in
 \cref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR},
 which shows that all but \IXalt{reference counting}{reference count}
-are enjoy reasonably fast and scalable readers.
+enjoy reasonably fast and scalable readers.
 
 The ``Number of Protected Objects'' row evaluates each technique's need
 for external storage with which to record reader protection.
@@ -336,7 +336,7 @@ has a \IXalth{bounded wait-free}{bounded}{wait free}
 it can carry out a finite traversal by executing a bounded number of
 instructions.
 
-The ``Reader Reference Acquisition'' rows indicates that only RCU is
+The ``Reader Reference Acquisition'' row indicates that only RCU is
 capable of unconditionally acquiring references.
 The entry for sequence locks is ``Unsafe'' because, again, sequence locks
 detect updates rather than acquiring references.
-- 
2.25.1


