Return-Path: <SRS0=fMf1=RX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kOgLQpXfmItL5pdKRWRcNf0F5Lo8nXzxxv6blyww1io=;
        b=KlotsGaJ9X+pHh874CiI2JVvNoK11R6rf5Yei2RrZMt7KNIug9Y/T5aReBgpif0qrq
         4OXaFFyZLBnuX5ZHzModd3+Hf7BcO7AlJpmxgdpcqw4w6IKQfzod/mLzLYPyCal//Dq2
         eY/4U3jNUL97HT+P/sUjymh0owQDkHoxDC2rHGtprgh8+sujuqa//5EpRmEqxtWFVnmP
         YYw3HKj8WbsCyN5mZdlKiRFcvAoFAghdRp/XPiGOu8Omf8wTSmUC/1ZVLKjtcTLmRsMF
         zu3Mm/xpPbvDRFon8KXOhzyOpNYKflRogkAOd8idPNE6pAX07ScdYEgGL4tgfXZEE08O
         ABGg==
Subject: [PATCH -perfbook 2/2] Revert "defer/rcuintro: Fix ThomasEHart2006a
 punctuation issue."
References: <29dac258-de72-0b10-3778-4e34fe4005ce@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <60f82107-877a-f866-ec4e-3503ad99ab66@gmail.com>
Date: Fri, 7 Jan 2022 12:50:02 +0900
MIME-Version: 1.0
In-Reply-To: <29dac258-de72-0b10-3778-4e34fe4005ce@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This reverts commit 8e3364bead009d44f7ec8ef2a42d667211cb1fcc.

It was neither necessary nor right.

The warning from punctcheck.pl observed after commit dee11baa44fa
("treewide: Add acronym tags for QSBR and EBR") was a false positive,
which has been fixed by using a stricter pattern.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuintro.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index dbea667f..13b0b1be 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -429,7 +429,7 @@ state shown at the bottom of
 \label{fig:defer:QSBR: Waiting for Pre-Existing Readers}
 \end{figure}
 
-This approach is termed \IXacrfst{qsbr}~\cite{ThomasEHart2006a}.\@
+This approach is termed \IXacrfst{qsbr}~\cite{ThomasEHart2006a}.
 A QSBR schematic is shown in
 \cref{fig:defer:QSBR: Waiting for Pre-Existing Readers},
 with time advancing from the top of the figure to the bottom.
-- 
2.17.1


