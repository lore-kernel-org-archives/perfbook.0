Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=/gdjbyWHNzjyY4bFt3f6hhrJk+0/e6pEhY1WTDxXi+U=;
 b=AWzWO2pT8kKdB25bpBbXZ0o3XrxMj3mcpkdrbp3FQ2Vsw4/R2vkoiIAu2pr0+9owWe
 eHJuYMWiXlGxp+9ew/UnSzrkfgEfEBIEmbaqxccd25BZeSi6LZWJGqV4MpuvNYtO3dp+
 KhZiq8vVPJdGXe0pRP2IrxFYy72ePDY6C8EGrrpYUY4zqIcmekQchbzdVb80kkDw+Fe9
 yR9HnRKilbPzNY/6AOcw/78BAABf+i9nRtNe4o8RhBCEQFVIOCTFaqfKgT144cjC8S6z
 aqy/jPedGxcunXBTNiHBwa0TPs6ovaIUNQNkx6SrDE2EEJwAZV4xP1Xr4Tk6OCI5xsoF
 ubzQ==
Subject: Re: [RFT PATCH 1/5] Further improvement of build scripts (was Re:
 [RFT PATCH 0/5] Another round of build script tweaks)
References: <9f8a3c0d-75fe-0b6f-733f-2134f67ccd6f@gmail.com>
 <a14c9dfc-9404-4db6-27f7-73bbddf0ce21@gmail.com>
 <2824f7bb-1848-d8dc-c4da-4193c92b9800@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b6c6743b-8048-b7dd-cf27-da676613bad4@gmail.com>
Date: Tue, 3 May 2016 21:24:40 +0900
MIME-Version: 1.0
In-Reply-To: <2824f7bb-1848-d8dc-c4da-4193c92b9800@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi.

I had a trouble with this patch myself.
This patch changes the targets "embedfonts" and "extraction" to empty targets.
This will create actual files of those names.
If you checkout to another branch after those files are created,
the original Makefile does not work properly.

If you encounter this issue, please remove those files manually.

I should have used different names for the empty targets.

Sorry for the trouble.

                                              Thanks, Akira

