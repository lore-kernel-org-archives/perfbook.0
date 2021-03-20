Return-Path: <SRS0=Ggdu=IS=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=4uQ21T4OotJWl+b+HHPqFcPFjYkmWFXTdBzP7CmQreA=;
        b=MHvYG35NHAHILGLpsXKK6mYTEEiBXpQIuCL4qi9ZCrMZ8P3/xhR+sGtly8vP2R2KO8
         yGmIkI09fGUYTecC9Rs/uugjB/0pC3n6BVkU/DbL+XxG9QAikfyhQH0BTZgTGsXTZ8cO
         ZA6xTwc/iaH/U0LMDh9A2ND9de2rUKubrrCq39rZXHXuSGuCXSO/TKWVOadArlQ+bToh
         6U+vAV1E2op3h3ZRYkfT739KUHhNlOhsYSHvKiAyRsjvCyLGU5UI0UKUYKsRpBSTBrwe
         UoY3WfVAOMf+59IwqE4+zgw+9901dJ0LSzobnGJAFPPHXM6psFOqNdQSF2PHIGgatqpv
         v+QA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Possible update candidate in whymb
Message-ID: <aaa92b9c-2d25-df1c-8229-64b3fb06ab53@gmail.com>
Date: Sat, 20 Mar 2021 11:23:36 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

In Appendix C, which you have not updated for a while,
there is a statement made in commit bb869fd89bfd ("Add
caution about cache coherence and I/O for new-to-SMP
architectures") more than a decade ago, which might
be an update candidate.

Thoughts?

        Thanks, Akira

------
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 868758a4..284d48f4 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1639,7 +1639,7 @@ future such problems:
        It is my painful duty to inform you that as embedded systems
        move to multicore architectures, we will no doubt see a fair
        number of such problems arise.
-       Hopefully these problems will clear up by the year 2015.
+       Hopefully these problems will clear up by the year 202x.
