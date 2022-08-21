Return-Path: <SRS0=GKoe=YZ=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=WJr4YOLhsrQBouZRsE7jtGFS5WM39XagYDpX+aK8t6Q=;
        b=GJGJVJZnLXusI+Oj7lTpefucIrmypvRHSarOghEY92wtrRI1ntglAK2+RYWLHjD3y+
         jK7Rb7jumBybiKyk2iLasXkfsfx0Udz8E+Ci+8ralFZp+zG7PVhYJf0C/wn9W4uWDIB2
         wPskzHI/6+6OUwMzmLKzeF34gDuEFHO5z4/GJ1h7Gnuv/c7AAYi4AZoHp6SWIR5GRvFm
         MkDvthOtdB7skbChcNi83bMbeu8MuSR16k3lSuCGj38LSmGozOFBZ4Klw1Y5J+Mo7rpX
         pdHXhh9+ukO+y6MUcZRgItFAMq+p92/jRRAS6NX2Pz2q5b7C7AgoA9xQ5nhwXKlcaUQR
         Sevg==
Message-ID: <61a2ce14-2eb5-cab9-a454-ca7073fefef7@gmail.com>
Date: Sun, 21 Aug 2022 13:57:42 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2] count: Switch from GCC to C11 thread-local storage
Content-Language: en-CA
References: <20220817110049.182128-1-e2lahav@gmail.com>
 <0dfcdb91-12d7-86f7-4c8d-26a101bec7b5@gmail.com>
 <CAJbg=FW02u8dCHnTE9nEUtvGvVQKpEzUZByXs0O0qc9hQK6XyA@mail.gmail.com>
 <20220819020258.GJ2125313@paulmck-ThinkPad-P17-Gen-1>
From: Elad Lahav <e2lahav@gmail.com>
In-Reply-To: <20220819020258.GJ2125313@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2022-08-18 22:02, Paul E. McKenney wrote:
> Incrementalist that I am, my thought is to take this one thing at a
> time, if and when.  ;-0

What would you like to do? I have no objection to dropping this change, 
but I think (at least in principle) that using standard language 
features is better than using compiler-specific extensions. If nothing 
else it makes the MISRA folks happy ;-)

--Elad
