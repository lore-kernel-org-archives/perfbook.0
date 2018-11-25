Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=f8nYr5VIiWTMgP83oFI3NtnIvc+Fbeg9Gm2j4H12uac=;
        b=jicCYsOIrVMSf+lJYWhk+hWhzugPAga6W2+7TtuRsDV9+NSZo9PSvWzIxwylLRwOpJ
         nTRvdRYDJKZXnko9Xn06YpPBLFrJOuWNTKtICQU+bFPSdogFnls4n2YovKprurL8jmLt
         OHyn3B1aw3Wt4/rqwE0BzHj22wBo2xPWff0B7IQ3iG7BX0EpjRDZVmxwrCnoa3zZMEnG
         AEbGjLIphl0zhrmYU65f27+ZMzOjwBLoVj5MSDYYBokwOIEkncF8UZHcF809vhZHrKYP
         CyKJOusF5Z2jfcXgIPtSVWEwAKrq6RfSBv3lx7RpLgkDlEnbd8QQQE7iA1oEphFueknC
         QWZg==
Subject: Re: [PATCH 0/3] Employ new scheme for code snippets (cont.)
References: <1c49a5ed-290f-f81c-a768-b2d5d2450b43@gmail.com>
 <20181125170159.GB4170@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e91f0cf9-4710-1ef1-705c-ad4deeaf1ccb@gmail.com>
Date: Mon, 26 Nov 2018 07:07:12 +0900
MIME-Version: 1.0
In-Reply-To: <20181125170159.GB4170@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/11/25 09:01:59 -0800, Paul E. McKenney wrote:
> On Sun, Nov 25, 2018 at 11:44:41PM +0900, Akira Yokosawa wrote:
>> >From 4ebe85f38ed5f0e003847854b64bc8773bec8ebb Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sun, 25 Nov 2018 23:30:16 +0900
>> Subject: [PATCH 0/3] Employ new scheme (cont.)
>>
>> Hi Paul,
>>
>> This is a set of patches to further apply the new scheme for snippets in
>> chapters "owned" and "defer". Further updates in "defer" will be submitted
>> shortly.
> 
> Good stuff, applied, thank you!
> 
> I also fixed a filename typo (my fault, not yours)

Well, it was *my* typo in 2/3 of the patch set. (There was no mention
of the file name.)

Thank you for catching it!

Akira

>                                                    and expanded a bit
> on the topic of mechanical reference counting.
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>> --
>> Akira Yokosawa (3):
>>   owned: Employ new snippet scheme
>>   defer: Employ new snippet scheme for route_seq.c
>>   defer: Employ new scheme for snippets of route_refcnt.c
>>
>>  CodeSamples/defer/route_refcnt.c |  67 +++++++++--------
>>  CodeSamples/defer/route_seq.c    |  42 +++++------
>>  defer/defer.tex                  |  76 ++++----------------
>>  defer/refcnt.tex                 | 152 +++++++++------------------------------
>>  owned/owned.tex                  |  19 ++---
>>  5 files changed, 115 insertions(+), 241 deletions(-)
>>
>> -- 
>> 2.7.4
>>
> 

