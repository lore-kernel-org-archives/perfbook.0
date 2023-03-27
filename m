Return-Path: <SRS0=q6y/=7T=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679935363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nVFtfAYUXA4hHXp3SdFWFy+EStrTfDF6lFqZgwWksYk=;
        b=RK77Fj/+/t/2P3hKRcprOwNmMU0AT/WsX1xAfKkG5FmtPnXMvOwq6zTDKAMJwnWmr3
         fiv4IvEVyK7Yx1vwy7PIRMhowiJ7Pnzstb9vJ2myErXzKPs/3w/XgjShCYuwZ5EiaOXy
         rP8BLcb9Jcu8yPtucE16ZIB3WuvKtesqoIPcUN7W5X1AALnTf3qGPBnnsXrUmdkBipCh
         vx97pvmXND0DxYHcA7KLC6CAMkErhSKffnt2WCUPeILUzGEjxOuudmSPKQ8kWbHadxnN
         6ZSE6NC3uu80F2oAKjReYSiDslEEFK86onQlrw83vmodAW6SkfWmJtcgBFoJvkgTVksb
         oHqg==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH v2] CodeSamples/count: add necessary partial memory barriers
Date: Mon, 27 Mar 2023 12:42:35 -0400
Message-Id: <20230327164235.399487-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: akiyks@gmail.com
Cc: paulmck@kernel.org, perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patch add two necessary partial memory barriers, the first one change
READ_ONCE to smp_load_acquire to makes sure the reading from theftp[t]
happens before the reading from counterp[t]. The litmus testing below
represents the pattern, and the result is "Sometimes":

C counter_sig

{}

P0(int *theft, int *counter)
{
    int r0;
    int r1;

    r0 = READ_ONCE(*theft);
    r1 = READ_ONCE(*counter);
}

P1(int *theft, int *counter)
{
    WRITE_ONCE(*counter, 1);
    smp_mb();
    WRITE_ONCE(*theft, 1);
}

exists (0:r0=1 /\ 0:r1=0)

Second one change WRITE_ONCE to smp_store_release to make sure that setting
counterp[t] happens before the setting theftp[p] to THEFT_IDLE. Here is the
litmus testing, The result is "Sometimes":

C counter_sig_2

{
    int theft = 1;
    int counter = 1;
}

P0(int *theft, int *counter)
{
    WRITE_ONCE(*counter, 0);
    WRITE_ONCE(*theft, 0);
}

P1(int *theft, int *counter)
{
    if (READ_ONCE(*theft) == 0)
    {
        smp_mb();
        WRITE_ONCE(*counter, READ_ONCE(*counter)+1);
    }
}

P2(int *counter)
{
    int r0;

    r0 = READ_ONCE(*counter);
}

exists (2:r0=2)

Note that I added one smp_mb() in P1's "if" statement,
because in add_count/sub_count's fast path, there is a
control dependency.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 CodeSamples/count/count_lim_sig.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
index 023d6215..09582429 100644
--- a/CodeSamples/count/count_lim_sig.c
+++ b/CodeSamples/count/count_lim_sig.c
@@ -81,7 +81,7 @@ static void flush_local_count(void)			//\lnlbl{flush:b}
 	for_each_tid(t, tid) {				//\lnlbl{flush:loop2:b}
 		if (theftp[t] == NULL)			//\lnlbl{flush:skip:nonexist}
 			continue;			//\lnlbl{flush:next2}
-		while (READ_ONCE(*theftp[t]) != THEFT_READY) {//\lnlbl{flush:loop3:b}
+		while (smp_load_acquire(theftp[t]) != THEFT_READY) {//\lnlbl{flush:loop3:b}
 			poll(NULL, 0, 1);		//\lnlbl{flush:block}
 			if (READ_ONCE(*theftp[t]) == THEFT_REQ)//\lnlbl{flush:check:REQ}
 				pthread_kill(tid, SIGUSR1);//\lnlbl{flush:signal2}
@@ -90,7 +90,7 @@ static void flush_local_count(void)			//\lnlbl{flush:b}
 		*counterp[t] = 0;
 		globalreserve -= *countermaxp[t];
 		*countermaxp[t] = 0;			//\lnlbl{flush:thiev:e}
-		WRITE_ONCE(*theftp[t], THEFT_IDLE);	//\lnlbl{flush:IDLE}
+		smp_store_release(theftp[t], THEFT_IDLE);	//\lnlbl{flush:IDLE}
 	}						//\lnlbl{flush:loop2:e}
 }							//\lnlbl{flush:e}
 
-- 
2.34.1

