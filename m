Return-Path: <SRS0=qhXQ=PH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=88felH9F4W8nMEFeTT5ryHZIXaP0cM1AuvJEZo5y5lA=;
        b=ggDmGLeGXypINY+sXca/H2A5vHqOL2xjbWsUDtiFsYUSBOUhJq1ziM5Wd++zvOaMnT
         Pl/SqmSg/ys+X+QR/l8tm75AwwPeeN4ukXdrXAjp06mTLHpYu0lDRLAwWnenMbDAuejV
         oGDmmoFwAHB1Q9K+RqAknKbPUX7H3dj2rdwJf1qavBiuW2VbP3I2xtpaaZ1PYIsuKyT1
         nWA+wLqQx80PO+1QoAd1txtBuzMz+SESURJFnKiu8ozmuNIXXbaWABvZ5x2tZVSO5HVq
         o+Srt6s1KluRYSvji66r9HHY8zWVm7g5EhxwmZqlm11LbrZ5TsiRhDRoMBsi9sB2v3xc
         leRg==
Subject: Re: [PATCH -perfbook] fixsvgfonts-urwps: Add patterns for 'URW
 Gothic'
References: <2ac75ef4-c43a-195a-f788-15f375e3b20b@gmail.com>
 <20211019040333.GD880162@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <31e09f3e-9f6d-e7e4-441c-f2b821091037@gmail.com>
Date: Tue, 19 Oct 2021 14:42:59 +0900
MIME-Version: 1.0
In-Reply-To: <20211019040333.GD880162@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Mon, 18 Oct 2021 21:03:33 -0700, Paul E. McKenney wrote:
> On Tue, Oct 19, 2021 at 11:06:41AM +0900, Akira Yokosawa wrote:
>> When built on Ubuntu Focal, Figure 3.9
>> (cartoons/r-2014-CPU-track-meet-phone-booth.pdf) does not have the
>> "TELE" sign.
>>
>> Ubuntu Hirsute and Fedora 34 don't have this issue, so it looks
>> like Ubuntu Focal lacks some configs for font-name aliases under
>> /etc/fonts/.
>>
>> As a workaround, add patterns taking care of "URL Gothic".
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Hi Paul,
>>
>> I'm not sure if you have the same issue on your Ubuntu 20.04,
>> but I noticed it and tested the workaround on the container image at
>> docker.io/akiyks/perfbook-build-focal:latest.
> 
> I did not notice until just now.  ;-)
> 
> I built a Fedora system, and it shows the "TELE" just fine even without
> this change.  But even with this change, I do not see the "TELE" on
> Ubuntu 20.04.  Quite possibly because I am missing fonts?

Or you might have failed to remove cartoons/r-2014-CPU-track-meet-phone-booth.pdf
before rebuilding with this change??

Still no "TELE"?
What does "fc-list | grep "URW Gothic" say?

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
[...]
