Return-Path: <SRS0=gDlb=Z5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Fju8CpYDuxqM1Dd3UuOZdO5+o5/5a53DAQbGz0eDZ5k=;
        b=gdJ28Mg8Xtsq6LrFzTcnHAo6171EZgmfFfk5GP3b1UP7mFHKf7Q4vbgKTFU3GgTZ4t
         IFOE1jTyr+c7G3JGB+DNRyjtwafA7e1TCrf1Lds9NvLkIWZAo5DG/wq9+Z6LJIaH4/Bw
         dTDiyU32Ff3tvH3VGxfjWcGhZZ/jXLADTr5q5Oe+iE1Sc8dr5fy8aldKYJrQ0wIIjPBq
         iNTNbOzS4cWB8NwvAujsFdIV6v3HxeQhB8Hvkm2tOV5/374DyFHFdKNn/N5w5z3v2Mwj
         NP9b8qtC+4tVbB0T1ZMtXT27d6MfFa2UuyIuNAfqptfcifVKPPzjKchthYiWVjxr+fYN
         /LrA==
Message-ID: <69602cd9-49af-7842-db73-53d1f19c2914@gmail.com>
Date: Mon, 26 Sep 2022 21:05:52 +0900
MIME-Version: 1.0
Subject: Re: And, at long last, another perfbook release
Content-Language: en-US
References: <20220925225024.GA549132@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220925225024.GA549132@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: e2lahav@gmail.com, johann@jklaehn.de, sj38.park@gmail.com, maplewish117@gmail.com, zhouzhouyi@gmail.com, Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

On Sun, 25 Sep 2022 15:50:24 -0700, Paul E. McKenney wrote:
> Hello!
> 
> The new v2022.09.25a release of perfbook is available, and the draft
> announcement is here:  https://paulmck.livejournal.com/68537.html
> Thank you all for your contributions to this release!
> 
> Please let me know if changes are needed.

Not on my contribution, but

    The code samples now use C11 thread-local storage instead of the
    GCC __thread storage class, courtesy of Elad Lahav.

IIUC, Elad touched one of many code samples, namely count_end.c.
So the conversion has just started.

For me, Elad's contribution of adding QNX as a platform for building
code samples looks much more interesting.

Just my 2 cents.

         Thanks, Akira

>                                           If I don't hear otherwise, I
> will post this more widely by the end of tomorrow (Monday), Pacific Time.
> 
> 							Thanx, Paul
