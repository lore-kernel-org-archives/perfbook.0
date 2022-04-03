Return-Path: <SRS0=E9hY=UN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=tlhv5NE0rDVAbVLFXMNzgIW9pyNGX2HlVuPPEWgk8kg=;
        b=gC5jiL11IDAC9mabzXTxtR6Uq+HhtWc6ZtcaHBtpOkg1KvCDgrd6hz8lKFJjNO5gus
         Yi+Hdjehd3pfYWRCsG++HUnwVRLLQhVy4nospHXrAXyEC01NzjumK4D6eEaEDfi71ipX
         gt2EGOJJOJ02uF43eD4Zfa6aKVZHraYHIhe1/lM+KBQqeetlGwpU5TlygNwuGN7x3o/Y
         a89xLxLM/6IDFvYkUX47b8uRF12tC1hyYKT92nYsqOykyrDGSMuRhSoX/4nnMoxLjJRH
         xcKvKXoEde9FUY5dKnJQH/8XXUxprbn/JoWKUF8oJg2tC8hOF4mQruVaiMyEd2QWJ/Ge
         Edjw==
Message-ID: <4ab3d51f-8eac-c931-1bcb-97e153fd474c@gmail.com>
Date: Sun, 3 Apr 2022 13:16:03 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] advsync: Fix markers of end-of-sentence periods
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Fixes: b97c0b4f0770 ("advsync: Fix punctuation-check complaints")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

Current punctcheck.pl ignores markers of mid-sentence periods
at line ends.
It might be possible to catch this type of errors.
Let me see if it is actually doable without false positives.

        Thanks, Akira
--
 advsync/advsync.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index 1a5034b1..13cf6cd4 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -507,7 +507,7 @@ For example, when running on typical computer systems, both loads and
 stores can result in page faults.
 Which cause in-kernel page-fault handlers to be invoked.
 Which might acquire locks, or even do I/O, potentially even using
-something like network file system (NFS).\@
+something like network file system (NFS)\@.
 All of which are most emphatically blocking operations.
 
 Nor are page faults the only kernel-induced hazard.
@@ -553,7 +553,7 @@ synchronization is far more important in theory than it is in practice.
 \label{sec:advsync:NBS Subdivided Operations}
 
 One common trick that provides a given algorithm a loftier place on
-the NBS ranking is to replace blocking operations with a polling API.\@
+the NBS ranking is to replace blocking operations with a polling API\@.
 For example, instead of having a reliable dequeue operation that might be
 merely lock-free or even blocking, instead provide a dequeue operation
 that will spuriously fail in a wait-free manner rather than exhibiting

base-commit: 5f28b7cb0d4c447c9d6397770906c7cb4c96832c
-- 
2.25.1

