Return-Path: <SRS0=TccY=7S=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679848184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XFjcjVrAiOAkmzSJTgQ8GYjimP3D7hoN+Rj4AZreJrs=;
        b=FaFetgzvEaysIs7uTTStJjaE4l9vFFHFzoHf/3/A9iuAaFZDtDNi1Q+BM2AubsTOJo
         SA2eeOeDlKcUFe+AkP2F9JfFpEIwQxT1z0x9wFRvl3TCH4Plgo7fGCza7yxNXbu1rjsd
         kLkltLTmoxAXzaA2dR/C62gWVTd8kOhXvUIOp1cpiUPMR6WKIk//+qUO8IHGN19tsPRX
         a/mSxaGphUfzVb0JT/y6Al3GSy3GKbCMJfA3HKgAqxQ0tLxpviefNmXUGdPUEmYTpaTL
         Ds18VNhaizuI8sM4xHE7bbKkN577Z8mLCs0I04pWRIhoUdLOiHbfSRONrIlBKVvykqYD
         VbnA==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] CodeSamples/count: add necessary memory barrier
Date: Sun, 26 Mar 2023 12:28:28 -0400
Message-Id: <20230326162828.165472-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, perfbook@vger.kernel.org
Cc: Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patch add two necessary memory barriers, the first one added in
flush_local_count makes sure the reading from theftp[t] happens before
the reading from counterp[t]. The litmus testing below represents the
pattern, and the result is "Sometimes":

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

Second memory barrier is added to make sure that setting counterp[t]
happens before the setting theftp[p] to THEFT_IDLE. Here is the litmus
testing, The result is "Sometimes":

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
 CodeSamples/count/count_lim_sig.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
index 023d6215..7bfeb004 100644
--- a/CodeSamples/count/count_lim_sig.c
+++ b/CodeSamples/count/count_lim_sig.c
@@ -86,10 +86,12 @@ static void flush_local_count(void)			//\lnlbl{flush:b}
 			if (READ_ONCE(*theftp[t]) == THEFT_REQ)//\lnlbl{flush:check:REQ}
 				pthread_kill(tid, SIGUSR1);//\lnlbl{flush:signal2}
 		}					//\lnlbl{flush:loop3:e}
+		smp_mb();
 		globalcount += *counterp[t];		//\lnlbl{flush:thiev:b}
 		*counterp[t] = 0;
 		globalreserve -= *countermaxp[t];
 		*countermaxp[t] = 0;			//\lnlbl{flush:thiev:e}
+		smp_mb();
 		WRITE_ONCE(*theftp[t], THEFT_IDLE);	//\lnlbl{flush:IDLE}
 	}						//\lnlbl{flush:loop2:e}
 }							//\lnlbl{flush:e}
-- 
2.34.1

