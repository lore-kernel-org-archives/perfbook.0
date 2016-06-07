Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=h9x/TqHVh4edAgS8Mzu8SRRZqN0OPTVB19fVquZfbAY=;
 b=hDVWh3EC6QCeth9+9ePyki3YA9vdJCTUdpYsMGKbfuSRPhRxWAc0YRNOnYEV+EaGpP
 Nx6bsSISDghiaSoCuGsdHmR7UVJwSSNRWskyN4bb6b3+VU+PlqphDtAdZb23qzQCs+nC
 PHP+Bvk5pA6FBuUj67ndllLZ1RJZK+lePw31haxN1Em2JOsAxi/UeW1+hH0EIn8Qxea3
 efmUpF7vUcgsw4VLMkNLcIkI9nJiMDIqLGDjVydMtZZo/0bsz1ph5eXzW18wygDXowPO
 9/wcqRa6u3jVS8/89sW5d6Jt/cTe5mfGR1Z15R5i59LnxK1aq5BNepEGFabZ6xWBhhEk
 NcHQ==
Subject: Re: [RFC PATCH 0/3] Another round of cleanup and improvement of build
 scripts
References: <be0f87e8-a39f-6c82-1946-46bacfcd6f66@gmail.com>
 <20160607203351.GL3723@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <654099e5-1ade-4f17-c5e0-ccc395f2fea9@gmail.com>
Date: Wed, 8 Jun 2016 07:21:23 +0900
MIME-Version: 1.0
In-Reply-To: <20160607203351.GL3723@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/06/07 13:33:51 -0700, Paul E. McKenney wrote:
> On Sun, Jun 05, 2016 at 11:52:36PM +0900, Akira Yokosawa wrote:
>> >From d6c5dc0374c6e558d0acc003273b42537e50297f Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sun, 5 Jun 2016 23:34:26 +0900
>> Subject: [RFC PATCH 0/3] Another round of cleanup and improvement of build scripts
>>
>> Hi, 
>>
>> This series enables parallel build of '.pdf' figures in the first build
>> or a build after removing them by 'make distclean' or 'make neatfreak'.
>>
>> It is by no means complete, but it works just fine for the evaluation
>> purposes. Any feedback is welcome. Further improvements and cosmetic
>> changes are in my to-do list.
>>                                                      Thanks, Akira
> 
> I applied and pushed these, thank you.

Oh! I didn't expect them to be applied at the half baked stage...
Anyway, thanks.

> (And yes, I missed the pull request, so the SHA-1's do not match,
> apologies!)

No problem!

I'll submit followup patches later today. (I mean within 20 hours.)

                                                   Thanks, Akira

> 							Thanx, Paul
> 
>> The series can also be pulled as follows:
>>
>> ---- 
>> The following changes since commit e719d43325af354d6f0a8a8c8d914b82430a9ff4:
>>
>>   Add TEST_HASH symbol to allow tests to be excluded (2016-05-30 09:50:52 -0700)
>>
>> are available in the git repository at:
>>
>>   https://github.com/akiyks/perfbook.git cleanup-makefile
>>
>> for you to fetch changes up to d6c5dc0374c6e558d0acc003273b42537e50297f:
>>
>>   Makefile: Promote eps2pdf.sh to implicit rules (2016-06-05 23:17:49 +0900)
>> ----
>>
>> Akira Yokosawa (3):
>>   Remove .eps files whose sources are .dot
>>   FAQ-BUILD.txt: Add graphviz package as required
>>   Makefile: Promote eps2pdf.sh to implicit rules
>>
>>  FAQ-BUILD.txt           |   4 +-
>>  Makefile                |  62 ++---
>>  advsync/.gitignore      |   1 +
>>  advsync/store15tred.eps | 653 ------------------------------------------------
>>  count/.gitignore        |   1 +
>>  count/sig-theft.eps     | 435 --------------------------------
>>  6 files changed, 30 insertions(+), 1126 deletions(-)
>>  create mode 100644 advsync/.gitignore
>>  delete mode 100644 advsync/store15tred.eps
>>  create mode 100644 count/.gitignore
>>  delete mode 100644 count/sig-theft.eps
>>
>> -- 
>> 1.9.1
>>
> 
> 

