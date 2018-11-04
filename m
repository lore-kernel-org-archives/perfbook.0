Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Se9MW7AfXNCL39/pC6TI2rag0g0dWq3JynLXjy4cIC0=;
        b=tpXFkzWjakYCqomk+D3sxGByVwgtp/DcZZdOmlx7B5wEYEsNyeYo6V0QkQTGO165v1
         x52YpEGrZx/p3fhrDaipStK9LjKfrspRvTqZLnW68XtSjTdp8Ma8U6mRoUXI3OJ+1iwY
         o7lTy7NMB8MZI8l3OoFRUiFfjazElswIgq2CYMSkErostWDGeG4QWdayhnxI1692eC+H
         baZ591Ax0KwX0APG5xmQnYFja18dYbc1drFHTAbkJ1me7wEt+Rw5/wn7YgHXVSoVg90/
         sItrqftKpP43I/vU1bSAxSLc4upeQB30/OfyQDHnsVY/7OhiWVetNy934V9T0XxGqIyJ
         j1Sg==
MIME-Version: 1.0
From: Junchang Wang <junchangwang@gmail.com>
Date: Sun, 4 Nov 2018 20:14:50 +0800
Message-ID: <CABoNC80N5+fMJViPdNWhXqiDdS6JNwfab=8D2Q0Hfd0wQebj5w@mail.gmail.com>
Subject: Ask help for litmus tests
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Paul McKenney <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

Thanks for your email about litmus tests a few weeks ago. I can
successfully run litmus tests on all three servers I can touch (The
configurations of the servers are listed below). Everything goes well
except litmus tests C-CCIRIW+o+o+o-o+o-o (Listing 15.15) and
C-WRC+o+o-data-o+o-rmb-o (Listing 15.16). The "exists" assertions
never trigger on all of my servers. I understand that these assertions
trigger only if the speeds of propagating writing x to different CPU
cores varies a lot. So I have tried different litmus thread placement
strategies by adjusting the affinity setting of litmus7. For example:
$ litmus7 -affinity incr1 ... ...
$ ./C-WRC+o+o-data-o+o-rmb-o.exe +ra -p 0,1,6

But it seems my effort doesn't work; the exist assertions never
trigger. Did I miss something? What's the right/possible configuration
to trigger these assertions. I do know you might be very busy. But if
possible, please give me some hints. These two tests seems very
interesting :-). Thanks in advance.

Regards,
--Junchang

===
Three servers I can touch:
  1. One PPC server which consists of 8 cores. I don's know hardware
details (e.g. which cores share the same LLC or write buffer) because
tools such as dmidecode don't work.
  2. One ARM server with two Cavium CPU. 96 cores in total (no Hyper-threading).
  3. One Intel server with two Xeon E5-2630 CPUs, each of which
consists of 12 cores (with Hyper-Threading).

