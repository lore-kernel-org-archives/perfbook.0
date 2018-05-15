Return-Path: <bsingharora@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:from:date:message-id:subject:to:cc;
 bh=51bbuxNF6Z+XMSg4BORg4o7OO24eY4YSU8p8TYVHda4=;
 b=Wzjfqhy3ILKazGxdL2QKp76EpcF0duYD45tdtMZvQ3ru5khj0VbgwQxsXdq7u/p2qr
 zk869pJnjo7ic6NRcrTU6xzX2vvf67Jxu0rihf+yxTTdWLN5TfOqEELA2Wl1EuSILI1s
 EReCpeB0+2s0uDYZitYahQf0nTVb5TLVgEnJn0GRAOSWpIEFPEUDocWbOvn1bsRlvBjh
 hNaNY5+WAj5Xo+v+bf6qv2unYGIV2N7kxLlvpBS7gPBbvngnwSxvkyoyEVyx7EsGXOi3
 kX2XSg2xEodtdXDqSQ30XwXPIw2XW4bdK4xq8yEjsQphf/0c6eHyKyehbUqy6fd+yku/
 kpKA==
MIME-Version: 1.0
From: Balbir Singh <bsingharora@gmail.com>
Date: Tue, 15 May 2018 21:25:49 +1000
Message-ID: 
 <CAKTCnzm4Gw3i3w1LbpFw1xXXfZ3JpeniuQryZ1wWhtnW+BCKvg@mail.gmail.com>
Subject: Strange problems with perfbook compilation
Content-Type: text/plain; charset="UTF-8"
To: perfbook@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-ID: <perfbook.vger.kernel.org>

I am using Ubuntu 18.04 and make fails without too many details, a
little debug shows

CodeSamples/SMPdesign/smpalloc.canonical.eps -->
CodeSamples/SMPdesign/smpalloc.canonical.pdf
sh utilities/fixanepsfonts-urwps.sh
CodeSamples/SMPdesign/smpalloc.canonical.epsi
a2ping --below --hires --bboxfrom=compute-gs
CodeSamples/SMPdesign/smpalloc.canonical.epsi
CodeSamples/SMPdesign/smpalloc.canonical.pdf > /dev/null 2>&1

a2ping fails due to gs failure. I was able to keep the temporary file
and check what a2ping did, it eventually calls

which fails with

 gs -dWRITESYSTEMDICT -dNOPAUSE -sDEVICE=bbox
-sFN=CodeSamples/SMPdesign/smpalloc.canonical.epsi
/tmp/a2ping_pl-5942-576561132-c.tgs
Error: /undefined in --.beginpage--
Operand stack:
   false   --dict:1/1(L)--   --nostringval--   --dict:79/156(ro)(L)--
 --dict:1/1(L)--   --dict:0/0(L)--   --dict:79/88(ro)(L)--   0
Execution stack:
   %interp_exit   .runexec2   --nostringval--   --nostringval--
--nostringval--   2   %stopped_push   --nostringval--
--nostringval--   --nostringval--   false   1   %stopped_push   2015
1   3   %oparray_pop   2014   1   3   %oparray_pop   1998   1   3
%oparray_pop   1884   1   3   %oparray_pop   --nostringval--
%errorexec_pop   .runexec2   --nostringval--   --nostringval--
--nostringval--   2   %stopped_push   --nostringval--   1977   1   3
%oparray_pop   --nostringval--   1979   7   3   %oparray_pop
--nostringval--   1971   7   3   %oparray_pop   --nostringval--   9
Dictionary stack:
   --dict:981/1684(G)--   --dict:0/20(G)--   --dict:82/200(L)--
Current allocation mode is local
Last OS error: No such file or directory
Current file position is 491
GPL Ghostscript 9.22: Unrecoverable error, exit code 1

An strace shows that

Halftones/Default is missing

openat(AT_FDCWD,
"/usr/share/ghostscript/9.22/Resource/Init/Halftone/Default",
O_RDONLY) = -1 ENOENT (No such file or directory)

I could not find Halftone/Default anywhere in the apt-cache or on my filesystem

I was wondering if anyone else has run into similar issues and is debugging?

Warm Regards,

