Return-Path: <bsingharora@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=7fa8xIRcsyWsCajkpTV0bXFvwSSlKoEl5M55cahdq70=;
 b=TkDXa20pE/0SGntZAVCct15s6bervuF9eiU9SMljk+9zlYX7ox52ukOjV2um402WdB
 yByA71rmwM9vGUHWv+st7Ed7hG+sOls/yMgkhFoDRjvfxu2wJxmqxvT1UILaOk9SD193
 VrdA6nrUC8q6m4h8AAqxM28oGdQqxkSE57qrFC0W1c5u8FHLtqYCsVywHhOFU2u1Cyzj
 KlbmMn34s4WjSODnvu0GQ/92qtQ32L2mH686D6enRwlesRRJQ/tRhvzgxmfuVIdl7qcY
 dXPnaB4Q3ACCcqjs+28pdZHycV4FRtqZMVO0uhCAChsarANwJKMn7niKvC8aZMEZ2dMK
 rrRQ==
MIME-Version: 1.0
In-Reply-To: <29abac0f-048f-792d-7841-d3da891fea21@gmail.com>
References: 
 <CAKTCnzm4Gw3i3w1LbpFw1xXXfZ3JpeniuQryZ1wWhtnW+BCKvg@mail.gmail.com>
 <29abac0f-048f-792d-7841-d3da891fea21@gmail.com>
From: Balbir Singh <bsingharora@gmail.com>
Date: Wed, 16 May 2018 14:11:00 +1000
Message-ID: 
 <CAKTCnzkScpkao3zWQiSO_mjfxYwacLjBxXWpVnbCsEF0NTerSQ@mail.gmail.com>
Subject: Re: Strange problems with perfbook compilation
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-ID: <perfbook.vger.kernel.org>

On Tue, May 15, 2018 at 9:52 PM, Akira Yokosawa <akiyks@gmail.com> wrote:
> On 2018/05/15 21:25:49 +1000, Balbir Singh wrote:
>> I am using Ubuntu 18.04 and make fails without too many details, a
>> little debug shows
>>
>> CodeSamples/SMPdesign/smpalloc.canonical.eps -->
>> CodeSamples/SMPdesign/smpalloc.canonical.pdf
>> sh utilities/fixanepsfonts-urwps.sh
>> CodeSamples/SMPdesign/smpalloc.canonical.epsi
>> a2ping --below --hires --bboxfrom=compute-gs
>> CodeSamples/SMPdesign/smpalloc.canonical.epsi
>> CodeSamples/SMPdesign/smpalloc.canonical.pdf > /dev/null 2>&1
>>
>> a2ping fails due to gs failure. I was able to keep the temporary file
>> and check what a2ping did, it eventually calls
>>
>> which fails with
>>
>>  gs -dWRITESYSTEMDICT -dNOPAUSE -sDEVICE=bbox
>> -sFN=CodeSamples/SMPdesign/smpalloc.canonical.epsi
>> /tmp/a2ping_pl-5942-576561132-c.tgs
>> Error: /undefined in --.beginpage--
>> Operand stack:
>>    false   --dict:1/1(L)--   --nostringval--   --dict:79/156(ro)(L)--
>>  --dict:1/1(L)--   --dict:0/0(L)--   --dict:79/88(ro)(L)--   0
>> Execution stack:
>>    %interp_exit   .runexec2   --nostringval--   --nostringval--
>> --nostringval--   2   %stopped_push   --nostringval--
>> --nostringval--   --nostringval--   false   1   %stopped_push   2015
>> 1   3   %oparray_pop   2014   1   3   %oparray_pop   1998   1   3
>> %oparray_pop   1884   1   3   %oparray_pop   --nostringval--
>> %errorexec_pop   .runexec2   --nostringval--   --nostringval--
>> --nostringval--   2   %stopped_push   --nostringval--   1977   1   3
>> %oparray_pop   --nostringval--   1979   7   3   %oparray_pop
>> --nostringval--   1971   7   3   %oparray_pop   --nostringval--   9
>> Dictionary stack:
>>    --dict:981/1684(G)--   --dict:0/20(G)--   --dict:82/200(L)--
>> Current allocation mode is local
>> Last OS error: No such file or directory
>> Current file position is 491
>> GPL Ghostscript 9.22: Unrecoverable error, exit code 1
>>
>> An strace shows that
>>
>> Halftones/Default is missing
>>
>> openat(AT_FDCWD,
>> "/usr/share/ghostscript/9.22/Resource/Init/Halftone/Default",
>> O_RDONLY) = -1 ENOENT (No such file or directory)
>>
>> I could not find Halftone/Default anywhere in the apt-cache or on my filesystem
>>
>> I was wondering if anyone else has run into similar issues and is debugging?
>
> Hi,
>
> This is a known issue of a2ping 2.77p with Ghostscript 9.22 or later.
>
> This conflict is now detected in Makefile updated yesterday.
> Please fetch the current master and see #7 in FAQ-BUILD.txt.
>
> You need to manually download a2ping 2.83p.
>
> If you have trouble with updating a2ping, please let me know.

I can confirm that this now works for me

Thanks,
Balbir Singh.

