Return-Path: <SRS0=Fff6=GG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6Kh6i5f+XOrW4yh+/WVtVKfdrAmkfHs+pRuTwc7PnJA=;
        b=m6o+IK7OfD7aqb/OxvnsqLJMaiNxO47KdmfKuwNCCeUXqU90ic/bJFwKgKiL4g5bEP
         /PqXAPiV2r8dmWdCXQCLrcqIYayxH0mbkDvvLl4nD2cpZE78LEce325jtiZStIcA72Qo
         vystffVb2iFSeml+v6eSq7vwUCaXkNgmOZ4Mwe3989coZ7J8pnaNgDyXUhQKdMKOUvGf
         nBupeWmBG8ex6jKn3mbmg3jRCRGGRP5TQ++t1wTot8Ww6clFHeWxe6c8PIiS0C2D95Zu
         BUAH308X5m7jOk1TndpcCst6Lo9sUxxH+Z1Fw8VQW7F5rnmWLKbu+tvt9l3dGvYIg03V
         Ighw==
Subject: Re: Request for clarification on Alpha reordering
References: <CAApSCJY_u9gsLHUY+=mBVBXzxU_oS8mF5CM5d_RkDFw7asPmyg@mail.gmail.com>
 <20210103035250.GE12032@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7a4a8cbf-8828-6a2b-b45b-372eb84534ba@gmail.com>
Date: Sun, 3 Jan 2021 13:12:40 +0900
MIME-Version: 1.0
In-Reply-To: <20210103035250.GE12032@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: Daniel Nitzan <danny.nitzan@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat, 2 Jan 2021 19:52:50 -0800, Paul E. McKenney wrote:
> On Sun, Jan 03, 2021 at 12:04:24AM +0200, Daniel Nitzan wrote:
>> In 15.5.1 (Alpha) - In regard to the following statement: "Yes, this
>> does mean that Alpha can in effect fetch the data pointed to before it
>> fetches the pointer itself, strange but true."
>> I'd appreciate it if someone could clarify what this means. I don't
>> understand this statement in light of the actual data-dependent
>> reordering presented in this section, i.e. the pointer itself is
>> fetched, points to the correct location in memory, but the data is
>> stale.
> 
> Yes, your last statement is equivalent.  Either way, the reading CPU sees
> the new value of the pointer and the old value of the pointed-to data.
> You can look at it either as counter-intuitive reordering (as I did)
> or as counter-intuitive stale data (as you did).
> 
> The key point is that these values are not in a single location, but
> are instead replicated across the CPUs' caches.  Stores are therefore
> not atomic unless the hardware goes to a lot of trouble to make them
> appear to be atomic.

Hi Paul,

Off topic, but smp_read_barrier_depends() as a kernel API
has been removed since Linux v5.9 [1].
Now READ_ONCE() for Alpha uses mb() [2].

You might want to reflect these changes in perfbook before the
release of the Second Edition.

[1]: merge commit https://git.kernel.org/linus/145ff1ec090d
    ("Merge tag 'arm64-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux")
[2]: commit https://git.kernel.org/linus/d64628588515
    ("alpha: Override READ_ONCE() with barriered implementation")

        Thanks, Akira

> 
> 							Thanx, Paul
> 
