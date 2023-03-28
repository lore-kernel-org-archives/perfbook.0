Return-Path: <SRS0=OWBg=7U=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680015513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rCJ7wye4pSGNIjV5R4VEQfqO8K6wAX9Q5sVJ+O2+sGA=;
        b=F0+KCS3yJxD52j/n+3CJVX+a52w1f+H73HJ9u9j9zzD2OyMP6JiqXyUTHIMB7SdS8X
         skn0aU2QWZAY+29O2UMv8KAz/Yljuco3eGM9t+Rg+KXmWDxrad6zI46LWJ0L0ZIjopXu
         tLi/vttiFr0TgGiZYzn+YoW/uey2jnI1HlE1XjO2VwGg7DpGep7n2R5MnwV8KATnXayD
         1SjeFhEGFj/kNIkxiUDP6pQCTOh4tVOllVOMEo3tlZ3GwdN34g7ClB6G2UZ3t8HKHMX/
         usvdMAh8Tf2xip/JdH4vUOMH+6QxsHOkin5B5yLsOuvuI09f2ZzYYFAZiX6z3Cxal1Mr
         Moig==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH v3] CodeSamples/count: add necessary partial memory barriers
Date: Tue, 28 Mar 2023 10:58:24 -0400
Message-Id: <20230328145824.632910-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patch add several necessary partial memory barriers, the first one
change READ_ONCE to smp_load_acquire to makes sure the reading from theftp[t]
happens before the reading from counterp[t]. The litmus testing below
represents the original code pattern, and the result is "Sometimes":

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
        WRITE_ONCE(*counter, READ_ONCE(*counter)+1);
    }
}

P2(int *counter)
{
    int r0;

    r0 = READ_ONCE(*counter);
}

exists (2:r0=2)

Note that I also changed the reading of theft variable
to smp_load_acquire in add_count/sub_count's fast path
to make sure that reading theft happens before reading
counter.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 CodeSamples/count/count_lim_sig.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
index 023d6215..59da8077 100644
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
 
@@ -116,7 +116,7 @@ int add_count(unsigned long delta)			//\lnlbl{b}
 
 	WRITE_ONCE(counting, 1);			//\lnlbl{fast:b}
 	barrier();					//\lnlbl{barrier:1}
-	if (READ_ONCE(theft) <= THEFT_REQ &&		//\lnlbl{check:b}
+	if (smp_load_acquire(&theft) <= THEFT_REQ &&		//\lnlbl{check:b}
 	    countermax - counter >= delta) {		//\lnlbl{check:e}
 		WRITE_ONCE(counter, counter + delta);	//\lnlbl{add:f}
 		fastpath = 1;				//\lnlbl{fasttaken}
@@ -155,7 +155,7 @@ int sub_count(unsigned long delta)
 
 	WRITE_ONCE(counting, 1);
 	barrier();
-	if (READ_ONCE(theft) <= THEFT_REQ &&
+	if (smp_load_acquire(&theft) <= THEFT_REQ &&
 	    counter >= delta) {
 		WRITE_ONCE(counter, counter - delta);
 		fastpath = 1;
-- 
2.34.1

