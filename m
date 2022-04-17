Return-Path: <SRS0=kqNA=U3=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=jVj7m6h+nRfiIql8dBp7+LD724ScKLOtmXXkcxMTV2w=;
        b=PQpA6+lQEzoCx/lPm+9VlcxysNDxNjSxVpxKXqrVq1+HkJqYzQ0z+1epBs6PhypK49
         HVsUsvY4T3hZ3G99iz1d5r0/bC8A6YOs6jLr1Pj2zzGsAUOrsD8j2Kfz9PsaGihK/N6l
         acDPoCX1qz63CKVXtcedmhgdAKJ23ksqn13ZfhtzPcGE8T8krgFKL5uNXLBbcCsv2eZV
         lzNG1tGDZonDfndhkZJGyrq3fWin330+cbpniTh17nEbPG91S9BCeluVvXuHW+UsHRVv
         pIGlg5+/PyPyoPRGNJoRx8lLgfSjXTVx/mUQQUxnZ0t2p0DaU+u1C7i7eGVrpgHWvs93
         jf3A==
Date: Sun, 17 Apr 2022 11:09:47 +0000
From: Hao Lee <haolee.swjtu@gmail.com>
Subject: [PATCH] whymb: fix description in DMA coherence
Message-ID: <20220417110947.GA27447@haolee.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, haolee.swjtu@gmail.com
List-ID: <perfbook.vger.kernel.org>

CPU caches need to be flushed before DMA operations to avoid data
overwriting.

Signed-off-by: Hao Lee <haolee.swjtu@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index b49d5fe8..4ec27962 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1640,7 +1640,7 @@ future such problems:
 	in any DMA buffer before presenting that buffer to the
 	I/O device.
 	Similarly, you need to flush the CPU caches of any location
-	in any DMA buffer after DMA to that buffer completes.
+	in any DMA buffer before DMA to that buffer completes.
 	And even then, you need to be \emph{very} careful to avoid
 	pointer bugs, as even a misplaced read to an input buffer
 	can result in corrupting the data input!
-- 
2.21.0

