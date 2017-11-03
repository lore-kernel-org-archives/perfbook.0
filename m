Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=VYfjHi4mL8tNFdfbE7r+5vvw5nCJuxV8IaeKyvnEki8=;
 b=bQsRuRJ5t9eguoX8WaEmIcNN6IFoA4rhCmC0J1wKV3u+rtD6YgsXPKveg1iy8T53yA
 d5iWHzsBrHzDwYo5b3OlTxmMtP4vVXL3mnM+n1axfXgwb2P2M/RNlH8PMY4Bj6D+JB+p
 maVisl+rqgNgGxJX876B4xhclKGPK+vIHu5zD+ZjpRdsw3yvlIRxNY5I9RVngRscl00w
 0yq9RgJ6zTMxnH91empgYJvU1RL3o3z70g46o8BAEEJBiCYzVna6dnW4TzmdPSBeHYC6
 We+VF41vly7rz8FKN6fsHZq1GUT6SDp4FGGsPaI4twu5WMopfG8vUG+LZNaO5deGj6t3
 5XZQ==
MIME-Version: 1.0
In-Reply-To: <20171103122719.GH3624@linux.vnet.ibm.com>
References: 
 <CAJYFCiOuj6O18jBM=tWX6wxhXi4sskV-2WYYPvGLgU6LS3aH4w@mail.gmail.com>
 <20171103122719.GH3624@linux.vnet.ibm.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Fri, 3 Nov 2017 21:33:48 +0800
Message-ID: 
 <CAJYFCiPhiFLBjPCjS5DcpcbYphs6bGqwbG94idiDqSVfVsNF8g@mail.gmail.com>
Subject: Re: Invalid compilation without -fno-strict-aliasing
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thanks Paul,

2017-11-03 20:27 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> On Fri, Nov 03, 2017 at 09:54:15AM +0800, Yubin Ruan wrote:
>> Does anyone have any idea why this thread
>>
>>     https://lkml.org/lkml/2003/2/25/270
>
> Hmmm...  This is quite the blast from the past.  Compilers have changed
> a bit in the last 14 years.  Nevertheles...

Unfortunately I got several old servers with GCC 3.x so I have to keep
an eye on these things (and worse, I am one of those guys who like to
home-brew some locking primitives...)

>> is related to strict-aliasing? To me, a compiler barrier like this will fix it:
>>
>>     if((stream + event_len) < ends) {
>>         iwe->len = event_len;
>>         barrier();
>>         memcpy(stream, (char *) iwe, event_len);
>>         stream += event_len;
>>     }
>
> As with many bugs, there are a number of ways to fix this one.  I suggest taking
> a look at the documentation for -no-strict-alias.  This stackoverflow URL might
> not be a bad place to start:
>
> https://stackoverflow.com/questions/23848188/strict-aliasing-rule-and-char-pointers

Basically I understand what aliasing means (for the C/C++ Languages)
and I know what a strict aliasing rule it is. I just cannot see why a
strict aliasing rule will cause this reordering problem...

Yubin

