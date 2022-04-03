Return-Path: <SRS0=E9hY=UN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=eVMd0qq62gBSn2FDyAhQDNgwpWQsrq/8S1YDEnqxFTs=;
        b=TuC1GR2im8/Y6rMnoXLDbzElSulnee8nz54M/uyhZ3qHDj1PSENAIkxpQgAFOdOim+
         PD9DlnJNTlub/Cpdu5Ld/rvBpNwlVQRvW0WSmm6ehodx2eMMVW8SL8lCFxBmD6pV34QK
         3hM7/iWsaG7YLIb1JKb5iXws99rXuME9JOUV/bWBNQtOqlHkk9QiOM7FbuR9DgssBBis
         j6S5L7yLHvziy5m0Y9wCDdBIEQxY4vKKoDj71wnPfNhJK6TvKwuUcPqhjcneEZ1i8Thf
         MzPGmf/A9eItpVLPes4xJIBYdirnE02NPeCELWSQNsSxvv/P+Ix1oD+ptLmmFY4sSamd
         NYqw==
Message-ID: <4edd1109-2614-26a1-c622-5905690e0b47@gmail.com>
Date: Sun, 3 Apr 2022 09:11:10 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] advsync: Fix typo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/advsync.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index df372b4e..d35a64fd 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -432,7 +432,7 @@ largely orthogonal to those that form the basis of real-time programming:
 	it knows about, and, in the absence of such constraints,
 	its level best to honor process priorities and to provide
 	fair scheduling to processes of the same priority.
-	Non-demonic schedulers allows real-time programs to use simpler
+	Non-demonic schedulers allow real-time programs to use simpler
 	algorithms than those required for
 	NBS~\cite{DanAlitarh2013PracticalProgress,BjoernBrandenburgPhD}.
 \item	NBS forward-progress guarantee classes assume that a number

base-commit: 432a94b0b7e1436a00587a0988fb678def465882
-- 
2.25.1

