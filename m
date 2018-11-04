Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UNoHnoWEaYXMSMMmMuUeO51iSd/0H1/Ng+I0cG83HBM=;
        b=NKA6LvJGaH5sEGlX3AWB16/mOWSDwuy3pLUIgPn7TTOITX+aHAyTqdnfGdrfgnshpE
         KDcRlewDXkUdNfgM42v1mjegjAxvRoscwDVwIihPK/LnQt4kQz3NY4FO4PLseVfcHmRo
         LJ7LBlZ0rpVFkhxHDnxQLDdB7i+09dHfTQ4PVZITEiyzbcFUSUDDhkNE90GZ1TOqUK9V
         wW4NnoEB+IbXGI6gdNyft1uq/KBXx0aE+6gXxhUJSsosEm412EqkXFSA5us1l4qpus1B
         +7WeKEp9iBFTsQN8qd0cX66aGE+Sy+yg3iFkF+fTvumbgZvYZod6IDgZB2KfOeHQrexj
         /Biw==
Subject: Re: Ask help for litmus tests
References: <CABoNC80N5+fMJViPdNWhXqiDdS6JNwfab=8D2Q0Hfd0wQebj5w@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <893a78b7-6110-0644-b20b-107ad1fdc2a2@gmail.com>
Date: Sun, 4 Nov 2018 23:21:32 +0900
MIME-Version: 1.0
In-Reply-To: <CABoNC80N5+fMJViPdNWhXqiDdS6JNwfab=8D2Q0Hfd0wQebj5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>
Cc: Paul McKenney <paulmck@linux.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/11/04 20:14:50 +0800, Junchang Wang wrote:
> Hi Akira,
> 
> Thanks for your email about litmus tests a few weeks ago. I can
> successfully run litmus tests on all three servers I can touch (The
> configurations of the servers are listed below).

Hi Junchang,

Glad to know it helped you!

>                                                  Everything goes well
> except litmus tests C-CCIRIW+o+o+o-o+o-o (Listing 15.15) and
> C-WRC+o+o-data-o+o-rmb-o (Listing 15.16). The "exists" assertions
> never trigger on all of my servers. I understand that these assertions
> trigger only if the speeds of propagating writing x to different CPU
> cores varies a lot. So I have tried different litmus thread placement
> strategies by adjusting the affinity setting of litmus7. For example:
> $ litmus7 -affinity incr1 ... ...
> $ ./C-WRC+o+o-data-o+o-rmb-o.exe +ra -p 0,1,6

By klitmus7, I have seen a low probability "Sometimes" on POWER8 system.

One of the results reads:

----------------------------------------------------------
Test C-WRC+o+o-data-o+o-rmb-o Allowed
Histogram (6 states)
60327103:>1:r1=0; 2:r2=0; 2:r3=0;
22740026:>1:r1=1; 2:r2=0; 2:r3=0;
5       *>1:r1=1; 2:r2=1; 2:r3=0;
51117838:>1:r1=0; 2:r2=0; 2:r3=1;
55552319:>1:r1=1; 2:r2=0; 2:r3=1;
10262709:>1:r1=1; 2:r2=1; 2:r3=1;
Ok

Witnesses
Positive: 5, Negative: 199999995
Condition exists (1:r1=1 /\ 2:r2=1 /\ 2:r3=0) is validated
Hash=43057833028631b2f87eb65fe95c0ba2
Observation C-WRC+o+o-data-o+o-rmb-o Sometimes 5 199999995
Time C-WRC+o+o-data-o+o-rmb-o 68.34
----------------------------------------------------------

In theory, litmus7 can also trigger the "exists" clause, but it would
require a very long runtime.  Also please refer to the Answer to
Quick Quiz 15.24. (You will find my name is mentioned there.)

As Armv8 architecture is other-multicopy-atomic, this "exists" clause
should never trigger, I suppose.

As for C-CCIRIW+o+o+o-o+o-o, herd7 says

----------------------------------------------------------
Test C-CCIRIW+o+o+o-o+o-o Allowed
States 47
2:r1=0; 2:r2=0; 3:r3=0; 3:r4=0;
2:r1=0; 2:r2=0; 3:r3=0; 3:r4=1;
2:r1=0; 2:r2=0; 3:r3=0; 3:r4=2;
2:r1=0; 2:r2=0; 3:r3=1; 3:r4=1;
[...]
2:r1=2; 2:r2=2; 3:r3=0; 3:r4=2;
2:r1=2; 2:r2=2; 3:r3=1; 3:r4=1;
2:r1=2; 2:r2=2; 3:r3=1; 3:r4=2;
2:r1=2; 2:r2=2; 3:r3=2; 3:r4=1;
2:r1=2; 2:r2=2; 3:r3=2; 3:r4=2;
No
Witnesses
Positive: 0 Negative: 72
Condition exists (2:r1=1 /\ 2:r2=2 /\ 3:r3=2 /\ 3:r4=1)
Observation C-CCIRIW+o+o+o-o+o-o Never 0 72
Time C-CCIRIW+o+o+o-o+o-o 0.06
Hash=8e54976d74e1bc1ec5b6ce10eda3cb12
----------------------------------------------------------

It says "Never", so if you could ever trigger the condition on a
real machine, it would've meant something wrong in the implementation
on the platform side (cache coherency).

Hope this helps.

       Thanks, Akira

> 
> But it seems my effort doesn't work; the exist assertions never
> trigger. Did I miss something? What's the right/possible configuration
> to trigger these assertions. I do know you might be very busy. But if
> possible, please give me some hints. These two tests seems very
> interesting :-). Thanks in advance.
> 
> Regards,
> --Junchang
> 
> ===
> Three servers I can touch:
>   1. One PPC server which consists of 8 cores. I don's know hardware
> details (e.g. which cores share the same LLC or write buffer) because
> tools such as dmidecode don't work.
>   2. One ARM server with two Cavium CPU. 96 cores in total (no Hyper-threading).
>   3. One Intel server with two Xeon E5-2630 CPUs, each of which
> consists of 12 cores (with Hyper-Threading).
> 

