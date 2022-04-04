Return-Path: <SRS0=JJuA=UO=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/LVtAUSFNcp/zUOUmivnBZHhkcTuIkvp87V/nSRkQUg=;
        b=EzP+p9BD1S33pFnuKRVzD/k+PlmGGeq/QDB/3iVwQTlLvsTPDlOKMeZuIKT15kQ1d+
         ZcaIrD1Zvtp62K/cEwfDCFKOWmx2583JLlFi9zHBbkn9EKntc2/7N65OpWbHHW0Mno5M
         uf8M+vNiAx7dt1P6Xc4vY3nAq4ux2QuC8odPAuFSM0ybgkOMiGTKH0dZAJbei+M5YJts
         v/LG+e5ESNhxQq1eVslNzg8n2b95GzSkGsgMATEnXNbRGLLvfm39QDTr4u5+XKIlXvAG
         /ZjGIA+lfRmOioSBh/wNONmtkwltd1bJfVOJRzsgvn/OlkVDx37EOMW31oFLybGlYbJk
         NHfQ==
Message-ID: <d81ce9d7-3b7f-22a9-ad5b-ced5e1664a90@gmail.com>
Date: Mon, 4 Apr 2022 09:29:24 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook v2 4/3] together/applyrcu: Fix typo
Content-Language: en-US
References: <d68c77bc-b10e-3e4c-5d03-0f18c65e04f5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <d68c77bc-b10e-3e4c-5d03-0f18c65e04f5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
And I noticed this in one of the hunks in Patch 3/3.
Sending as a follow up.

        Thanks, Akira
--
 together/applyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index a3ee559e..2a5a3c12 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -815,7 +815,7 @@ way of stopping in the middle and resuming later.
 For example, in Linux kernel v5.16, the \co{khugepaged_scan_file()}
 function checks to see if some other task needs the current CPU
 using \co{need_resched()}, and if so invokes \co{xas_pause()} to
-adjust the traveral's iterator appropriately, and then invokes
+adjust the travesal's iterator appropriately, and then invokes
 \co{cond_resched_rcu()} to yield the CPU\@.
 In turn, the \co{cond_resched_rcu()} function invokes \co{rcu_read_unlock()},
 \co{cond_resched()}, and finally \co{rcu_read_lock()} to drop out of
-- 
2.25.1


