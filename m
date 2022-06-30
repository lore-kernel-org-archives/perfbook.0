Return-Path: <SRS0=ZdbJ=XF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OfOwvdqmWSbYc5z8TKIwdVrj9n7/zW7zgfRwT1SfaRI=;
        b=e18gZ5GQ+hot0Nw44CuigvP2PNe389KyayqLqZugXx7G/AF1u6oNkaw+jFAoRi6eNU
         Pl8Zxw+aR3T59SDitICcmKlyuazR3Zh1tB8QDZxVKoGCFRIo4xKiHebbrSjQe1wY8mw0
         5KZHWg5gdFhAbSmBMrGmgfrhI8BGCfYyt0XdF9dBT3SgebfgxpcfZJfciDwiqpoie49n
         aJx9qRh2TDlctLV5edrskZcoBhc0NjcCQuckgwF7Hk8OJQTd510FNAiN4uCVWvrJYJlh
         Wf21tM1Dklc676Diel3IFwVHPLj+wkNlIF73fz6glLc/qj7dLrQpZiTQinQ68KE1tMgc
         L87w==
Message-ID: <aebf5e16-e85e-c2a6-77a0-c48a6f33cf3b@gmail.com>
Date: Thu, 30 Jun 2022 23:18:46 +0900
MIME-Version: 1.0
Subject: Re: Is parallel programing hard...
Content-Language: en-US
References: <32CE6D0C-1D26-423E-8A7F-AAC47B085DFF@illinois.edu>
 <20220626030351.GI1790663@paulmck-ThinkPad-P17-Gen-1>
 <efc0a14f-2265-39b7-8d57-b2a6a35e0b46@gmail.com>
 <4004322A-4FF7-435F-8427-A01621C106B1@illinois.edu>
 <0b12a2ee-5edd-d169-2b8c-1a403df7e34c@gmail.com>
 <20220627141106.GD1790663@paulmck-ThinkPad-P17-Gen-1>
 <fb3a89ba-48ec-1943-4f6f-84123b751b37@gmail.com>
 <20220627145628.GE1790663@paulmck-ThinkPad-P17-Gen-1>
 <c341ba87-ba38-11ba-c770-e341c5164b42@gmail.com>
 <40DCB8FE-A5C4-47F9-8215-EC0432803FF1@illinois.edu>
 <20220630002720.GR1790663@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220630002720.GR1790663@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: "Snir, Marc" <snir@illinois.edu>, Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Wed, 29 Jun 2022 17:27:20 -0700, Paul E. McKenney wrote:
> OK, MacTex worked much better for me, meaning that this time it did
> not hang when I attempted to install it.  However, once installed,
> it complains that it is missing xcrun, whatever that might be.

In search of "macOS 12 xcrun error", I got the following:

https://osxdaily.com/2021/07/19/fix-xcrun-error-invalid-active-developer-path-error-terminal-mac/

Is your issue similar to this one?

(I have no experience with macOS, so take this as just a hint.)

> 
> My thought is to get a release out, then see what can be done about
> making this build on MacOS.  Seem reasonable?

Sounds reasonable to me!

        Thanks, Akira

> 
> Hey, I said I had access to MacOS, not that I was at all competent at
> installing software on it.  ;-)
> 
> 							Thanx, Paul
> 
[...]
