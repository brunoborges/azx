# Build
FROM jekyll/jekyll:3.8.5 as build
COPY . /srv/jekyll
RUN rm -rf /srv/jekyll/Gemfile.lock .gems/ && \
    jekyll build

FROM jekyll/jekyll:3.8.5
COPY --from=build /srv/jekyll/ /srv/jekyll/
CMD jekyll serve
