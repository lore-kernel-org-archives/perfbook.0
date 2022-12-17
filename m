Return-Path: <SRS0=RX9K=4P=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reAlltyl/yHJhQHKMiN40aBARKvAd5KecSoWaRlJMHo=;
        b=ESZ7GT0nMNVLqCUh3y6lJdOK0ujq3mZL0LmA7TP2ojtiG1MTysv+5CzCw5BQ9YfjJu
         0sNvNMDNfSLaouWAY8pG4RX8nPfsj9ueXG9tiCZba3Nt5sR7h55tYnRCAtxliRaTLtDa
         ZvTq14jtcp80fKbYqm9QxgMsYl/g3D8XltkrbKwfQMlTIT/pAyxh9udAEySQCyraRL+a
         XNUtjH4qRyFzgpGzC7uSpy1tLLc/2CRDUjcrCvQoQTeGZPMUlQbUqsMrkF+8p8HIKe24
         WGgSV3tYAn9kTLimenIOj7Vzv/TbMwQiPiS3EG0xKhrSsGKVBKJp8XZgl3ys1eBuQvQR
         BOqQ==
Message-ID: <bd77b4d5-1be3-02b8-63b9-b97b15c03444@gmail.com>
Date: Sat, 17 Dec 2022 11:21:30 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] advsync/rt: Fold long list in \cite{}
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

You can break inside \cite{}.
This should be easier to maintain.

        Thanks, Akira
---
 advsync/rt.tex | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/advsync/rt.tex b/advsync/rt.tex
index 58dfc3224cb0..e9db1b04fc37 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -834,8 +834,13 @@ If configured properly, a non-trivial undertaking, \co{CONFIG_NO_HZ_FULL}
 offers real-time threads levels of performance that come close to those of
 bare-metal systems~\cite{AbdullahAljuhni2018nohzfull}.
 \ppl{Fr\'{e}d\'{e}ric}{Weisbecker} produced a practical guide to
-\co{CONFIG_NO_HZ_FULL}
-configuration~\cite{FredericWeisbecker2022nohzIntro,FredericWeisbecker2022nohzFullDynticksInternals,FredericWeisbecker2022nohzfull,FredericWeisbecker2022HousekeepingTradeoffs,FredericWeisbecker2022practicalExample,FredericWeisbecker2022nohzfullTSC}.
+\co{CONFIG_NO_HZ_FULL} configuration~\cite{
+	FredericWeisbecker2022nohzIntro,
+	FredericWeisbecker2022nohzFullDynticksInternals,
+	FredericWeisbecker2022nohzfull,
+	FredericWeisbecker2022HousekeepingTradeoffs,
+	FredericWeisbecker2022practicalExample,
+	FredericWeisbecker2022nohzfullTSC}.
 
 There has of course been much debate over which of these approaches
 is best for real-time systems, and this debate has been going on for

base-commit: f59c468b212e66597c8f0c594839da53ccd1e949
-- 
2.25.1

