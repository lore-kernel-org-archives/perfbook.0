Return-Path: <twoerner@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5EGMsrRdtwakkQE6pRtCM2Tt8BM3+aYJuKo7IonXkX4=;
 b=Yy3dpRYmwuObWuU0+0ninnwSLgjxAyc2HxOJmGoaIHxgmnyu+21O6q7nYGduFEZyyg
 FZl+JH3XK/hmYcRSNxxpZW86F4NR+WmpuOJfCXpCiZZ6VnalCrcpm5/YD1aaUYTjQyeC
 d1SBjwxkM2UYa8CyXrE8kYknaXOShmLfVvzAJDyN3OHzdk0A/xFqqgJ/ybxtGnjXHOuw
 nLmbHMpeWEb5o+GyiU5CvTotgVhBmB7ZuuMpbQLUb7gOEgA61abG1BZwtkmJcEimgxKW
 Fue13cjD5dKwhbE9/PVC10TMBSG6DfVuovp079bUWFMD5tqz/0rDu8vtBX+Urx4Tc8sm
 L2ig==
Date: Wed, 18 Jan 2017 12:00:32 -0500
From: Trevor Woerner <twoerner@gmail.com>
Subject: Re: [PATCH] utilities/autodate.sh: too many \s
Message-ID: <20170118170032.GA3021@linux-uys3>
References: <20170116234125.28692-1-twoerner@gmail.com>
 <d63ae83f-f918-73df-14f1-a7eb01f99e66@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d63ae83f-f918-73df-14f1-a7eb01f99e66@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

On Tue 2017-01-17 @ 08:30:57 PM, Akira Yokosawa wrote:
> On 2017/01/16 18:41:25 -0500, Trevor Woerner wrote:
> > Remove extraneous \ which causes build to fail:
> I'm submitting a patch of the script with portability in mind.
> Can you try it?

Yes, this patch works for me. Thanks for the update, sorry for the delay.

